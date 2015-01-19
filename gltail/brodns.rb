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
#   This is a parser which handles Bro DNS logs with gltail.
#
#######################################################

class BroDNSParser < Parser

    def parse( line )

        unless (line.include?('#'))
            __, ts, uid, id_orig_h, id_orig_p, id_resp_h, id_resp_p, proto, trans_id, query, qclass, qclass_name, qtype, qtype_name, rcode, rcode_name, qr, aa, tc, rd, ra, z, answers, ttls, rejected, = line.split(" ")

        add_activity(:block => 'Querie Type', :name => qtype_name)
#        add_event(:block => 'DNS Queries', :name => "DNS Queries", :message => "DNS Request: " + name, :update_stats => true, :color => [1.5, 1.0, 0.5, 1.0])

        end
    end
end
