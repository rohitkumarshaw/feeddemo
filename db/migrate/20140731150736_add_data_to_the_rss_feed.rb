class AddDataToTheRssFeed < ActiveRecord::Migration
  def self.up
    RssFeedUrl.create!(:url => "http://news.google.com/?output=rss")
    RssFeedUrl.create!(:url => "http://feeds.reuters.com/reuters/sportsNews")
    RssFeedUrl.create!(:url => "http://feeds.reuters.com/reuters/lifestyle")

  end
  def self.down
    RssFeedUrl.delete_all(:url => "http://news.google.com/?output=rss")
    RssFeedUrl.delete_all(:url => "http://feeds.reuters.com/reuters/sportsNews")
    RssFeedUrl.delete_all(:url => "http://feeds.reuters.com/reuters/lifestyle")
  end
end
