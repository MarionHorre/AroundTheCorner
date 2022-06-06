class District < ApplicationRecord
  has_many :interest, dependent: :destroy
  has_many :houses, dependent: :destroy
  has_many :types, through: :interest

  validates :name, :description, :image, presence: true

  # def initialize
  #   @district_value = district_value
  # end

  # def district_value(district_value)
  #   puts "This district value is #{district_value}"
  # end
  # faire une method avec un compteur pour ressortir une value ?
end
