class DropAgencyTable < ActiveRecord::Migration[6.1]
  def change
    remove_reference :houses, :agency
    drop_table :agencies
  end
end
