class District < ApplicationRecord
  has_many :interest, dependent: :destroy
  has_many :houses, dependent: :destroy
end
