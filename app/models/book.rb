class Book < ApplicationRecord
  belongs_to :genre

  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_many :authored_books 
  has_many :authors, through: :authored_books

  validates :title, :synopsis, presence: true 
end
