class CreateRssFeeds < ActiveRecord::Migration
  def change
    create_table :rss_feeds do |t|
      t.string :name
      t.text :content
      t.string :guid
      t.string :url
      t.datetime :published_at

      t.timestamps
    end
  end
end
