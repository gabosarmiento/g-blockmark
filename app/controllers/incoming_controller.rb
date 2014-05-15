class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create

    sender = params["sender"]
    body_plain = params["stripped-text"]
    @category = Category.find_or_create_by!(params.require(:category).permit(name: "E-mail"))
    @user = User.where(email: sender)
    @bookmark = @user.bookmarks.create(params.require(:bookmark).permit(url: body_plain, category_id: @category.id))
    @bookmark.save
    # Assuming all went well. 
    head 200
  end
end