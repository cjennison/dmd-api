class Segment < ApplicationRecord
  belongs_to :campaign
  has_many :encounters
end
