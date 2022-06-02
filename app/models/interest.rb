class Interest < ApplicationRecord
  belongs_to :type
  belongs_to :district

  validates :longitude, :latitude, presence: true
end
