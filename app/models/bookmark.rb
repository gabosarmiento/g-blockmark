class Bookmark < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  default_scope { order('created_at DESC') }
end