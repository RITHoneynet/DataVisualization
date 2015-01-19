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
#   This is a parser which handles Bro SSL logs with gltail.
#
#######################################################

class BroSSLParser < Parser

    def parse( line )

        unless (line.include?('#'))
            __, uid, id_orig_h, id_orig_p, id_resp_h, id_resp_p, version, cipher, server_name, session_id, subject, issuer_subject, not_valid_before, not_valid_after, last_alert, client_subject, client_issuer_subject, cert_hash, validation_status, = line.split(" ")

        add_activity(:block => 'SSLVersion', :name => version)
        add_activity(:block => 'SSLCipher', :name => cipher)
        add_activity(:block => 'SSLValidation', :name => validation_status)
        #add_event(:block => 'SSLValidation', :name => "SSL Cert Validation", :message => "Cert Sstatus: " + data[:validation_status], :update_stats => true, :color => [1.5, 1.0, 0.5, 1.0])

        end
    end
end
