class Formation < ApplicationRecord
  serialize :positions
  has_many :teams

  validates :name, presence: true, uniqueness: true
end
