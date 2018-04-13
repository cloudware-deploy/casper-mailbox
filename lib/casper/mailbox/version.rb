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
    VERSION = File.read(File.expand_path('../../../../VERSION', __FILE__)).strip
  end
end
