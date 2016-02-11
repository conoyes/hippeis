#
# Copyright David Lakatos
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'socket'

listen_port = 2000
server = TCPServer.open listen_port
puts "Listening on port #{listen_port}"

loop {
  client = server.accept

  lines = []
  while line = client.gets and line !~ /^\s*$/
    lines << line.chomp
  end

  resp = lines.join("<br />")
  headers = ["http/1.1 200 ok",
            "date: tue, 14 dec 2010 10:48:45 gmt",
            "server: ruby",
            "content-type: text/html; charset=iso-8859-1",
            "content-length: #{resp.length}\r\n\r\n"].join("\r\n")
  client.puts headers
  client.puts resp
  client.close
}
