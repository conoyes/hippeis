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

class Authenticator
  @@valid_credentials =
  {
    'admin' => 'welcome123',
    'guest' => 'guest'
  }

  @@role_membership =
  {
    'administrators' => ['admin'],
    'users' => ['admin', 'guest']
  }

  def self.authenticate?(username, password)
    @@valid_credentials[username] == password
  end

  def self.has_role?(username, role)
    @@role_membership[role].nil? ? false : @@role_membership[role].include?(username)
  end
end