class Profession < ApplicationRecord
  has_many :log_players
  has_many :logs, through: :log_players
  has_many :players, through: :log_players
end
