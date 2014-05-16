class Category < ActiveRecord::Base
  #FriendlyID for nice looking urls
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  has_many :bookmarks
  validates :name, length: { minimum: 5 }, presence: true
end
