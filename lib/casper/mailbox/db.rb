#
# Copyright (c) 2018 Cloudware S.A. All rights reserved.
#
# This file is part of casper-mailbox.
#
# casper-mailbox is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# casper-mailbox  is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with casper-mailbox.  If not, see <http://www.gnu.org/licenses/>.
#

module Casper
  module Mailbox
    extend SP::Job::Common

    def self.insert(connector, entity = {}, payload = {}, cluster_id = 1)
      # {
      #   type: payload[:type],
      #   operations: [
      #     {
      #       action: payload[:action],
      #       file: payload[:file],
      #       external_id: payload[:external_id],
      #       attributes: payload[:attributes]
      #     }
      #   ]
      # }
      rs = db.execp(%Q[
          INSERT INTO public.connector_messages (connector, cluster_id, entity_type, entity_id, entity_tax_registration_number, payload)
          VALUES ($1, $2, $3, $4, $5, $6)
          RETURNING id
        ],
        connector.upcase,
        cluster_id,
        entity[:type],
        entity[:id],
        entity[:tax_registration_number],
        { type: payload[:type], operations: (payload[:operations] || []) }.to_json
      )

      if 'PGRES_TUPLES_OK' == rs.res_status(rs.result_status) && 1 == rs.ntuples
        return rs.first['id'].to_i
      end

      return false
    end
  end
end
