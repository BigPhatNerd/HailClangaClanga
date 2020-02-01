class AddHottyPottyId < ActiveRecord::Migration[6.0]
  def change
  	add_column :bots, :hotty_potty_id, :integer, limit: 8
  end
end
