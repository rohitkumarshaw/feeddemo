class RssFeed < ActiveRecord::Base
  attr_accessible :content, :guid, :name, :published_at, :url
  
   require 'feedjira'

  def self.update_from_feed(feed_url)
    feed = Feedjira::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries) if feed && feed.entries
  end

  def self.update_from_feed_continuously(feed_url, delay_interval = 1.minutes)
    feed = Feedjira::Feed.fetch_and_parse(feed_url)
    add_entries(feed.entries)
    loop do
      sleep delay_interval.to_i
      feed = Feedjira::Feed.update(feed)
      add_entries(feed.new_entries) if feed.updated?
    end
  end

  private
  def self.add_entries(entries)
    entries.each do |entry|
      unless exists? :guid => entry.id
        create!(
            :name         => entry.title,
            :content      => entry.summary,
            :url          => entry.url,
            :published_at => entry.published,
            :guid         => entry.id
        )
      end
    end
  end
  
  
end
