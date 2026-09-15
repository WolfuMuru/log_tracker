class Log < ApplicationRecord
  belongs_to :boss

  has_many :log_players
  has_many :players, through: :log_players
  has_many :professions, through: :log_players

  has_one_attached :log_file
end
