class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create

    puts "sender user #{params[:sender]}"
    puts "category name #{params[:subject]}"
    puts "bookmark url #{params[:'body-plain']}"
    @bookmark = Bookmark.new(params.require(:bookmark).permit(:url)) 
    @bookmark.category = params[:subject]
    @bookmark.url = params[:'body-plain']
    @bookmark.save
    # @bookmark.category = Category.find_or_create_by!(params.require(:category).permit(:name))
    # if @bookmark.save 
    #   puts "saved"
    # else
    #   puts "error"
    # end

    # Assuming all went well. 
    head 200
  end
end