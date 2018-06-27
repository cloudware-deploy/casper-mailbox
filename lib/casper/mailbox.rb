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

require "casper/mailbox/version"
require "casper/mailbox/engine"
require "casper/mailbox/db"

module Casper
  module Mailbox
    unless RUBY_ENGINE == 'jruby'
      # Specify that this gem is a JSONAPI resource publisher
      include SP::Duh::JSONAPI::ResourcePublisher

      # Publish the root location for JSONAPI resources configuration
      self.jsonapi_resources_root = File.join(File.expand_path(File.join(File.dirname(__FILE__), '..', '..')), 'config', 'jsonapi', 'resources')
    end
  end
end
