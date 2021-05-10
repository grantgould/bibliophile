class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :follows, class_name: "User"

  validate :self_following

  validates :follower, uniqueness: { scope: [:follows] } 

  def to_s
    "#{follower} is following #{follows}"
  end

  private 
    def self_following
      if self.follower_id == self.follows_id
        errors.add :follower, "cannot follow themselves."
      end
    end
end
