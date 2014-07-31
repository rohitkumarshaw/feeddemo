class FeedsController < ApplicationController

  require 'feedjira'

  def index
   feed = FeedEntry.update_from_feed("http://news.google.com/?output=rss")
    @feed_entries = FeedEntry.order('published_at ASC')
  end

  def edit

    @feed_entry = FeedEntry.find(params[:id])

  end

  def update

    @feed_entry = FeedEntry.find(params[:id])
  
    respond_to do |format|
      if @feed_entry.update_attributes(params[:feed_entry])
        format.html { redirect_to FeedEntry, notice: 'FeedEntry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feed_entry.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
   @feed_entry = FeedEntry.find(params[:id])

     if  @feed_entry.destroy
       respond_to do |format|
         format.html { redirect_to FeedEntry }
         format.json { head :no_content }
       end
     end

  end

end
