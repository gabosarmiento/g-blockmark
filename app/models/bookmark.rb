class Bookmark < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :votes, dependent: :destroy
  default_scope { order('created_at DESC') }
  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true
  
  def like_votes
    self.votes.where(value: 1).count
  end

  def unlike_votes
    self.votes.where(value: -1).count
  end

  def points
    self.votes.sum(:value).to_i
  end
end
