class Interest < ApplicationRecord
  belongs_to :type
  # belongs_to :district

  validates :address, :longitude, :latitude, presence: true
end
