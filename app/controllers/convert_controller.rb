class ConvertController < ApplicationController

  def index
    
    
  end

  def feed

    @q = params[:q]
    @feed_url = "http://fbgraphjsontorss.heroku.com/convert/feed/?q=#{@q}"

    @data = Rails.cache.read(@q)
    
    if @data.nil?

      fg_client = FGraph::Client.new(:client_id => FB_APP_ID, :client_secret => FB_APP_SECRET)
      @data = fg_client.search(@q) # , :type => 'status'
      
  #    Rails.cache.write(@q, @data, :expires_in => 60.minutes)

    end
    

  end

end
