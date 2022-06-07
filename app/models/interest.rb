class Interest < ApplicationRecord
  belongs_to :type
  belongs_to :district
  geocoded_by :address
  validates :longitude, :latitude, presence: true
end
