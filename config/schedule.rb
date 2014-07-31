
set :environment, :development

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/home/rohit/cron_log.log"
# 
#set :output, {:error => 'error.log', :standard => 'cron.log'}
#
## adds ">> cron.log" to all commands
#set :output, {:standard => 'cron.log'}
#
## adds "2> error.log" to all commands
#set :output, {:error => 'error.log'}

#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
 every 1.minutes do
   runner "FeedEntry.update_from_feed('http://news.google.com/?output=rss')"
 end

# Learn more: http://github.com/javan/whenever
