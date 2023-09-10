class Wishlist < ApplicationRecord
  belongs_to :user

  # validates :due_date, presence: true
  # validates :due_date, presence: true, comparison: { greater_than: :Date.today }
  validates :due_date, presence: true
  validate :due_date_cannot_be_in_the_past, on: :create
  validates :list, presence: true, length: { 
    maximum: 50, wrong_length: "%{count}文字以下"
  }

  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add(:due_date, "（過去の日付は使えません）")
    end
  end
end
