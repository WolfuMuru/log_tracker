class Boss < ApplicationRecord
  enum :boss_type, {
    raid: "raid",
    fractal: "fractal",
    other: "other"
  }

  has_many :logs

end
