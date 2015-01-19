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
#   This is a parser which handles Bro Conn logs with gltail.
#
#######################################################

class BroConnParser < Parser

    def parse( line )

        unless (line.include?('#'))
            __, uid, id_orig_h, id_orig_p, id_resp_h, id_resp_p, proto, service, duration, orig_bytes, resp_bytes, conn_state, loacl_orig, missed_bytes, history, orig_pkts, orig_ip_bytes, resp_pkts, resp_ip_bytes, tunnel_parents, orig_cc, reap_cc, = line.split(" ")

        add_activity(:block => 'SrcIP', :name => id_orig_h, :size => orig_bytes)
        add_activity(:block => 'DstIP', :name => id_resp_h, :size => resp_bytes)
        add_activity(:block => 'Application', :name => service)
        add_activity(:block => 'Protocol', :name => proto)

        end
    end
end
