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

before '/login' do
  if session['is_authenticated']
    halt 200, 'already logged in'
  end
end

post '/login' do
  body = JSON.parse(request.body.read)
  username = body['username']
  password = body['password']

  if username.nil? || password.nil?
    halt 400
  end

  unless Authenticator.authenticate?(username, password)
    logger.info "authentication unsuccessful: #{username}:#{password}"
    halt 401
  end

  logger.info "authentication successful: #{username}:#{password}"
  session['username'] = username
  session['is_authenticated'] = true
  halt 200, 'login successful'
end