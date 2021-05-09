class Book < ApplicationRecord
  belongs_to :genre

  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_many :authored_books 
  has_many :authors, through: :authored_books

  validates :title, :synopsis, presence: true 
  validates :authored_books, presence: true

  accepts_nested_attributes_for :authored_books

  def to_s 
    title
  end
end
