#
# Cookbook Name:: chef_provisioning_vagrant
# Recipe:: default
#
# The MIT License (MIT)
#
# Copyright (c) 2016 Brandon Raabe
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

options = {
  vagrant_provider: 'virtualbox',
  vagrant_options: {
    'vm.box' => 'opscode-ubuntu-14.04'
  }
}

chef_gem 'chef-provisioning-vagrant'

require 'chef/provisioning'
require 'chef/provisioning/vagrant_driver'

directory "#{ENV['HOME']}/.chef/provisioning/vagrant" do
  action :nothing
  recursive true
end

with_vagrant_cluster "#{ENV['HOME']}/.chef/provisioning/vagrant"

vagrant_box 'opscode-ubuntu-14.04' do
  url 'http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubunut-14.04_chef-provisionerless.box'
end

with_machine_options options
