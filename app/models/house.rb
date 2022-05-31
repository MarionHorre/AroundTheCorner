class House < ApplicationRecord
  belongs_to :agency
  belongs_to :district
  has_many :bookmarks, dependent: :destroy
end
