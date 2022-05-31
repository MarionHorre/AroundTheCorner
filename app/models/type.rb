class Type < ApplicationRecord
  has_many :interests, dependent: :destroy
end
