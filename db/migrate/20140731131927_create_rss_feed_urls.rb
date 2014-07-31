class CreateRssFeedUrls < ActiveRecord::Migration
  def change
    create_table :rss_feed_urls do |t|
      t.text :url
      t.timestamps
    end
  end
end
