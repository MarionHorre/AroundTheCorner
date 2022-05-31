class Agency < ApplicationRecord
  has_many :houses, dependent: :destroy
end
