class Child < ApplicationRecord
  belongs_to :user
  validates :name, :date, :height, presence: true
end
