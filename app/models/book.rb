class Book < ApplicationRecord
  belongs_to :genre
  
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews

  validates :title, :synopsis, presence: true 
end
