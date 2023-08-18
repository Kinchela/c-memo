class Child < ApplicationRecord
  belongs_to :user
  has_many :records, inverse_of: :child
  accepts_nested_attributes_for :records, allow_destroy: true

  validates :user_id, presence: true
  validates :name, presence: true
end
