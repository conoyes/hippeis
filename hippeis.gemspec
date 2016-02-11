# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "hippeis"
  spec.version       = '0.1.0'
  spec.authors       = ["David Lakatos"]
  spec.email         = ["david.lakatos.hu@gmail.com"]
  spec.summary       = %q{Server side of a home automation project written in Ruby}
  spec.description   = %q{Server side of a home automation project written in Ruby. The server provides a RESTful JSON API for the clients.}
  spec.homepage      = "https://github.com/conoyes/hippeis"
  spec.license       = "http://www.apache.org/licenses/LICENSE-2.0"

  spec.files         = ['lib/hippeis.rb']
  spec.executables   = ['bin/hippeis']
  spec.test_files    = ['tests/test_hippeis.rb']
  spec.require_paths = ["lib"]
end
