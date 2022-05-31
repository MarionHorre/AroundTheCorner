class Agency < ApplicationRecord
  has_many :houses, dependent: :destroy

  validates :name, :email, :phone_number, :address, presence: true
end
