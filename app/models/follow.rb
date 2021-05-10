class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :follows, class_name: "User"

  validates :follower, uniqueness: { scope: [:follows] } 
end
