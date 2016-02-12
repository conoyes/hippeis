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
require 'sinatra'
require 'json'
require_relative 'reference_temperature'
require_relative 'api_temperature'
require_relative 'api_lighting'

# use Rack::Auth::Basic do |username, password|
#   username == 'admin' && password == 'secret'
# end

# the whole API is JSON based
before do
  content_type 'application/json'
end

not_found do
  message = 
  {
    'http_code' => 404,
    'message' => 'not found'
  }.to_json
end