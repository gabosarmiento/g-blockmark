class Bookmark < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  default_scope { order('created_at DESC') }
  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true
end
