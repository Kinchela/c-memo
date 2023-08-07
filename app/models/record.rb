class Record < ApplicationRecord
  belongs_to :child, inverse_of: :records

  validates_presence_of :child
  validates :date, presence: true   
  validates :height, presence: true, unless: proc { |s| s.weight.present? }
  validates :weight, presence: true, unless: proc { |s| s.height.present? }
  # validate :weight, unless: "height.present?"
end
