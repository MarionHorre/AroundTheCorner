class RemovingReferencesToHousesModelAndDb < ActiveRecord::Migration[6.1]
  def change
    remove_reference :houses, :district, index: true, foreign_key: true
  end
end
