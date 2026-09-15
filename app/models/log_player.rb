class LogPlayer < ApplicationRecord
  belongs_to :log
  belongs_to :player
  belongs_to :profession
end
