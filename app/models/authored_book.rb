class AuthoredBook < ApplicationRecord
  belongs_to :author
  belongs_to :book

  def to_s
    "#{author} authored #{book}"
  end
end
