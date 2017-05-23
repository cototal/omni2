# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
# If you need Rails loaded
# require File.expand_path(File.dirname(__FILE__) + '/environment')

# For just rails root
RAILS_ROOT = File.dirname(__FILE__) + "/.."

env :PATH, ENV["PATH"]
set :output, "#{RAILS_ROOT}/log/cron.log"
set :environment, ENV["RAILS_ENV"]

every 1.week, at: "6:00am" do
  rake "backup:db"
end

every :sunday, at: "6:00am" do
  rake "allowance:tasks"
end

every 1.month, at: "start of the month at 6am" do
  rake "allowance:monthly"
end