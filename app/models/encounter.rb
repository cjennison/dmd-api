class Encounter < ApplicationRecord
  belongs_to :segment
  belongs_to :campaign
end
