class Team < ApplicationRecord
  has_many :players, dependent: :destroy
  belongs_to :formation

  validates :name, :key, :owner_key, presence: true
  validates :key, uniqueness: true

  before_validation :set_key

  scope :published, -> { where(published: true) }

  def to_param
    self.key
  end

  private

  def set_key
    self.key = SecureRandom.hex(10) unless self.key
  end
end
