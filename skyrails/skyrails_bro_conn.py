#!/usr/bin/python

#######################################################
#
#   Written by David Pisano
#   RIT Honeynet Project
#
#   Copyright 2015 David Pisano
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#   The part of this code that sends the data to Skytails (Most of the code in the sendLine function)
#   was origenly writen by Felix Leder. It has been reused with his  permission.
#
#   python-sshtail library is needed to run this script.
#
#######################################################

import argparse
import os
import select
import socket
import struct
import sys
import time

from sshtail import SSHMultiTailer


# Defines formatting information for nodes and links
addToLine = 'with all nodes do (itemsize 3.0; itemcolor rgb: 255 0 0; \
itemtexture name "textures/computer.gif"; ) end; with all edges do (switch \
linktype do (link -> ( itemcolor rgb: 0 100 0; pullstrength 1.0 ; \
itemsize 3.0; itemtexture name "textures/holedarrow.gif"; ); ) end; ) end;'


def sendLine(sock, lineToSend):
    # Formats the line that is going to be sent to skyrails
    lineToSend = lineToSend.replace("\\", "\\\\").replace('"', '\"')
    lineToSend = '"' + lineToSend + '"'

    llen = struct.pack("I", socket.htonl(len(lineToSend)))

    outbuf = llen + lineToSend + "\x00\x00\x00\x01;"

    # Sends formated line to skyrails
    sock.sendall(outbuf)

    (r, w, e) = select.select([sock], [], [])
    if sock in r:
        print "Response:", sock.recv(100)


def fileSendLocal(sock, lineCount):
    i = 0
    fileRotatCheck = 0

    # Clears the workspace before we start sending link information
    lineToSend = './clearproject;'

    # Send line to Skyrails
    sendLine(sock, lineToSend)

    # Start to read the file and will do so for specified number of lines
    while i < lineCount:
        where = file.tell()
        line = file.readline()
        # If no new line sleep
        if not line:
            time.sleep(1)
            file.seek(where)
            fileRotatCheck = fileRotatCheck + 1
            # Checks for file rotation
            if fileRotatCheck == 5:
                # Find the size of the file and move to the end
                st_results = os.stat(filename)
                st_size = st_results[6]
                file.seek(st_size)
                fileRotatCheck = 0
        # When the line is new parse out src IP and dst IP
        else:
            fileRotatCheck = 0
            outpt = line.strip().split('\t')
            srcip = outpt[2]
            dstip = outpt[4]

            # Formates the line that needs to be sent
            lineFromFile = ('"{0}" -- link -> "{1}";'.format(srcip, dstip))

            # Added node and link formating to the end of the line
            lineToSend = lineFromFile + addToLine

            # Send line to Skyrails
            sendLine(sock, lineToSend)

            i = i + 1
            print i


def fileSendRemote(sock, lineCount, filePath, remote):
    i = 0

    # Clears the workspace before we start sending link information
    lineToSend = './clearproject;'

    # Send line to Skyrails
    sendLine(sock, lineToSend)

    tailer = SSHMultiTailer({remote: [filePath]})

    # Tail the remote file
    for host, filename, line in tailer.tail():
        # Parse out src IP and dst IP from each new line
        outpt = line.strip().split('\t')
        srcip = outpt[2]
        dstip = outpt[4]

        # Formates the line that needs to be sent
        lineFromFile = ('"{0}" -- link -> "{1}";'.format(srcip, dstip))

        # Added node and link formating to the end of the line
        lineToSend = lineFromFile + addToLine

        # Send line to Skyrails
        sendLine(sock, lineToSend)

        i = i + 1
        print i

        # Breaks for loop when line count reaches specified limit
        if i == lineCount:
            break


# Defines commandline arguments
parser = argparse.ArgumentParser()

parser.add_argument('-s', dest='skyrailsIP', required=True,
                    help='IP for Skyrails.')

parser.add_argument('-p', dest='skyrailsPort', default=1330, type=int,
                    help='Port for Skyrails. Default of 1330 is used.')

parser.add_argument('-f', dest='filePath', required=True,
                    help=('Path to the file to read, local or remote. IF '
                          'remote -r is needed.'))

parser.add_argument('-l', dest='loop', help='Run in a loop.',
                    action='store_true')

parser.add_argument('-n', dest='lineCount', required=True, type=int,
                    help='How many lines to read.')

parser.add_argument('-r', dest='remote',
                    help='IP of the remote server where the file is.')

parser.add_argument('--sleep', dest='sleepTime', default=10, type=int,
                    help='The number of seconds to wait between loops')

args = parser.parse_args()

host = args.skyrailsIP
port = args.skyrailsPort
count = args.lineCount

# Connect to Skyrails
s = socket.socket()
s.connect((host, port))

while True:
    # If file is local
    if args.remote is None:
        # Set the filename and open the file
        filename = args.filePath
        file = open(filename, 'r')

        # Find the size of the file and move to the end
        st_results = os.stat(filename)
        st_size = st_results[6]
        file.seek(st_size)

        fileSendLocal(s, count)
    # If file is remote
    else:
        fileSendRemote(s, count, args.filePath, args.remote)

    # Check to see if it should be running in a loop
    if args.loop is False:
        break
    else:
        # Waits specified amount time before starting the next loop
        time.sleep(args.sleepTime)

s.close()
