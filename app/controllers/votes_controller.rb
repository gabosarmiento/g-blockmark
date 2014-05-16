class VotesController < ApplicationController
  before_filter :setup

  def like
    update_vote(1)
    redirect_to :back
  end

  def unlike
    update_vote(-1)
    redirect_to :back
  end

  private

  def setup
    @category = Category.find(params[:category_id])
    @bookmark = @category.bookmarks.find(params[:bookmark_id])

    @vote = @bookmark.votes.where(user_id: current_user.id).first
  end

  def update_vote(new_value)
    if @vote # if it exists, update it
      authorize @vote, :update?
      @vote.update_attribute(:value, new_value)
    else # create it
      @vote = current_user.votes.build(value: new_value, bookmark: @bookmark)
      authorize @vote, :create?
      @vote.save
    end
  end
end