class Player < ApplicationRecord
  belongs_to :team
  validates :number, presence: true

  mount_uploader :photo, PhotoUploader

  def formation
    team.formation
  end

  def position
    formation.positions[number]
  end

  def position_style
    raise 'Position configuration error' unless position

    "top: #{position[:top]}px; left: #{position[:left]}px;"
  end
end
