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
#   This is a parser which handles Bro HTTP logs with gltail.
#
#######################################################

class BroHTTPParser < Parser

    def parse( line )

        unless (line.include?('#'))
            ts, uid, id_orig_h, id_orig_p, id_resp_h, id_resp_p, trans_depth, method, host, uri, referrer, user_agent, request_body_len, status_code, status_msg, info_code, info_msg, filename, tags, username, password, proxied, orig_fuids, orig_mime_tyes, resp_fuids, resp_mime_type, = line.split(" ")

            add_activity(:block => 'DomainName', :name => host)
            add_activity(:block => 'UserAgent', :name => user_agent)
            add_activity(:block => 'HTTPRequestType', :name => method)
            add_activity(:block => 'HTTPCode', :name => status_code)

        end
    end
end
