class RssFeedsController < ApplicationController
  # GET /rss_feeds
  # GET /rss_feeds.json


  require 'feedjira'

  def index
    
    if !params[:feed_url].blank?
      feed = RssFeed.update_from_feed("#{params[:feed_url]}")
    else
      feed = RssFeed.update_from_feed("http://news.google.com/?output=rss")
    end    
    
    @rss_feeds = RssFeed.order('published_at ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rss_feeds }
    end
  end

 
  # GET /rss_feeds/1/edit
  def edit
    @rss_feed = RssFeed.find(params[:id])
  end

  # POST /rss_feeds
  # POST /rss_feeds.json
  
  def create
    @rss_feed = RssFeed.new(params[:rss_feed])

    respond_to do |format|
      if @rss_feed.save
        format.html { redirect_to @rss_feed, notice: 'Rss feed was successfully created.' }
        format.json { render json: @rss_feed, status: :created, location: @rss_feed }
      else
        format.html { render action: "new" }
        format.json { render json: @rss_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rss_feeds/1
  # PUT /rss_feeds/1.json
  def update
    @rss_feed = RssFeed.find(params[:id])

    respond_to do |format|
      if @rss_feed.update_attributes(params[:rss_feed])
        format.html { redirect_to '/', notice: 'Rss feed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rss_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rss_feeds/1
  # DELETE /rss_feeds/1.json
  def destroy
    @rss_feed = RssFeed.find(params[:id])
    @rss_feed.destroy

    respond_to do |format|
      format.html { redirect_to rss_feeds_url }
      format.json { head :no_content }
    end
  end
  
  
  def feed_url   
    @rss_feed_urls = RssFeedUrl.all
  end
  
  def create_feed_url
    @rss_feed_url = RssFeedUrl.new(params[:rss_feed_url])
   
    
    respond_to do |format|
      if @rss_feed_url.save
        format.html { redirect_to feed_url_path, notice: 'Rss feed URL was successfully created.' }
        format.json { render json: @rss_feed_urls, status: :created, location: @rss_feed_urls }
      else
        format.html { render action: "feed_url" }
        format.json { render json: @rss_feed_urls.errors, status: :unprocessable_entity }
      end
    end
    
    
  end
  
  
end
