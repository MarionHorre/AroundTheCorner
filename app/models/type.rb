class Type < ApplicationRecord
  has_many :interests, dependent: :destroy
  has_one :district, through: :interest

  validates :category, :name, presence: true
end
