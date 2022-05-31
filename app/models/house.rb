class House < ApplicationRecord
  belongs_to :agency
  belongs_to :district
end
