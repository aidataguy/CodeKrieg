class QuotesController < ApplicationController
  
  def new
    @quote = Quote.new
  end
  
  def create
    @quote = Quote.new(params[:quote])
    @quote.request = request
    if @quote.deliver 
      #
    else
      render :new, notice: "The message could not be sent"
    end
  end
end