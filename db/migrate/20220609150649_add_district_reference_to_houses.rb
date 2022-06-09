class AddDistrictReferenceToHouses < ActiveRecord::Migration[6.1]
  def change
    add_reference :houses, :district, index: true
  end
end
