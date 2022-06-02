class ChangingReferencesDistrict < ActiveRecord::Migration[6.1]
  def change
    remove_reference :districts, :interest
    add_reference :interests, :district, index: true, foreign_key: true
  end
end
