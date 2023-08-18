class Wishlist < ApplicationRecord
  belongs_to :user

  validates :due_date, presence: true
  validates :list, presence: true, length: { 
    maximum: 50, wrong_length: "%{count}文字以下"
  }
end
