#
# Author:: Paul Mooring (<paul@opscode.com>)
# Cookbook Name:: windows
# Resource:: task
#
# Copyright:: 2012, Opscode, Inc.
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

# Passwords can't be loaded for existing tasks, making :modify both confusing
# and not very useful
actions :create, :delete, :run, :change

attribute :name, :kind_of => String, :name_attribute => true
attribute :command, :kind_of => String
attribute :cwd, :kind_of => String
attribute :user, :kind_of => String, :default => nil
attribute :password, :kind_of => String, :default => nil
attribute :run_level, :equal_to => [:highest, :limited], :default => :highest
attribute :force, :kind_of => [ TrueClass, FalseClass ], :default => false
attribute :frequency_modifier, :kind_of => Integer, :default => 1
attribute :frequency, :equal_to => [:minute,
                                    :hourly,
                                    :daily,
                                    :weekly,
                                    :monthly,
                                    :once,
                                    :on_logon,
                                    :onstart,
                                    :on_idle], :default => :hourly
attribute :start_day, :kind_of => String, :default => nil
attribute :start_time, :kind_of => String, :default => nil

attr_accessor :exists, :status

def initialize(name, run_context=nil)
  super
  @action = :create
  @provider = lookup_provider_constant(locate_default_provider)
end

private

def locate_default_provider
  begin
    WIN32OLE.new("Schedule.Service")
  rescue WIN32OLERuntimeError
    # no task scheduler 2.0 - selecting 1.0
    :windows_task_v1
  else
    # task scheduler 2.0 detected
    :windows_task_v2
  end
end
