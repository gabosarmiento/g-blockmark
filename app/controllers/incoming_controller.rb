class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    
    @user = params[:sender]
    puts "sender user #{user}"
    @name = params[:subject]
    puts "category name #{name}"
    @url = params[:bodyPlain]
    puts "bookmark url #{url}"
    @bookmark = Bookmark.new(params.require(:bookmark).permit(:url)) 
    @bookmark.user = @user
    @bookmark.category = Category.find_or_create_by!(params.require(:category).permit(:name))
    if @bookmark.save 
      puts "saved"
    else
      puts "error"
    end

    # Assuming all went well. 
    head 200
  end
end