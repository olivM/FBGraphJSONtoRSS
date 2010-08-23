class ConvertController < ApplicationController

  def index
    
    
  end

  def preview

    @q = params[:q]

    @data = Rails.cache.read(@q)
    
    logger.info params.inspect

    logger.info @data.inspect
    
    if @data.nil?

      response = HTTParty.get(@q)
      
      logger.info response.inspect
      
      Rails.cache.write(@q, response.body)

      @converted = response.body

    end

    
  end

  def feed

    @counter = Rails.cache.read(params[:q])
    @counter = @counter ? @counter + 1 : 1
    Rails.cache.write(params[:q], @counter)
    
  end


end
