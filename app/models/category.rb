class Category < ActiveRecord::Base
  has_many :bookmarks
  validates :name, length: { minimum: 5 }, presence: true
end
