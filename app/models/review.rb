class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user, uniqueness: { 
    scope: :book, message: "has already created a review for this book."
  }

  validates :rating, presence: true, 
            numericality: { greater_than: 0, less_than_or_equal_to: 5 }

  scope :year_in_review, 
        -> { where(created_at: 1.year.ago...DateTime.now) }
  
  def to_s 
    "#{user} reviewed #{book}"
  end
end
