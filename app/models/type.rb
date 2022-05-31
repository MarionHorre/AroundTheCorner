class Type < ApplicationRecord
  has_many :interests, dependent: :destroy

  validates :category, :name, presence: true
end
