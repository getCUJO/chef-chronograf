#
# Cookbook Name:: chronograf
# Recipe:: default
#
# Copyright 2015, Virender Khatri
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

node.default['chronograf']['config']['Bind'] = "#{node['chronograf']['bind_host']}:#{node['chronograf']['bind_port']}"
node.default['chronograf']['config']['LocalDatabase'] = ::File.join(node['chronograf']['local_database_dir'], 'chronograf.db')

chef_gem 'toml' do
  compile_time true
  version node['chronograf']['toml_gem_version']
end

include_recipe 'yum-plugin-versionlock::default' if %w[rhel amazon].include?(node['platform_family'])
include_recipe 'chronograf::install'
include_recipe 'chronograf::config'
