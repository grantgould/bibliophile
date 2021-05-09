class Author < ApplicationRecord
  validates :name, presence: true 

  has_many :authored_books
  has_many :books, through: :authored_books

  def to_s 
    name
  end
end
