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

require 'sinatra'

reference_temperature = ReferenceTemperature.new(273.15 + 25)

# https://github.com/conoyes/hippeis#temperature
get '/temperature' do
  {
    'current' => Temperature.celsius_offset + 10 + ::Random.new.rand(10),
    'current_celsius' => 10 + ::Random.new.rand(10),
    'reference' => reference_temperature.getTemperature,
    'reference_celsius' => reference_temperature.getTemperatureInCelsius
  }.to_json
end

post '/temperature' do
  body = JSON.parse(request.body.read)
  reference_temperature.setTemperature = body['reference']
end