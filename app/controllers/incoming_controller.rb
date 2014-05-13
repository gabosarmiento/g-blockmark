class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    
    # user = params[:sender]
    # category = params[:subject]
    # @category = Category.find_or_create_by!(params.require(:category).permit(:name))
    # @category.url = category
    # @bookmark = Bookmark.find_or_create_by!(params.require(:bookmark).permit(:url)) 
    # @bookmark.user = user
    # @bookmark.category = @
    
    # params[:body-plain]
    puts "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    head 200
  end
end