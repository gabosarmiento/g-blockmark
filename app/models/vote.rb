# == Schema Information
#
# Table name: votes
#
#  id          :integer          not null, primary key
#  value       :integer
#  user_id     :integer
#  bookmark_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookmark
  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }
end
