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

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "casper/mailbox/version"

Gem::Specification.new do |spec|
  spec.name          = "casper-mailbox"
  spec.version       = Casper::Mailbox::VERSION
  spec.authors       = ["Tiago Dias"]
  spec.email         = ["tiago.dias@cldware.com"]

  spec.summary       = %q{A gem to manage a mailbox system to send and receive messages with multiple connectors}
  spec.homepage      = "https://github.com/cloudware-deploy/casper-mailbox"
  spec.license       = "AGPL"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'sp-job'
  spec.add_dependency 'sp-duh' unless RUBY_ENGINE == 'jruby'
  spec.add_dependency "rails", "~> 3.2"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
