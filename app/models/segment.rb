class Segment < ApplicationRecord
  belongs_to :campaign
  has_many :encounters

  def self.generate_hash(length=10)
    SecureRandom.urlsafe_base64(length, false)
  end
end
