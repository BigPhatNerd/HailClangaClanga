class AddCountsToBotMethods < ActiveRecord::Migration[6.0]
  def change
  	add_column :bots, :retweets_id, :integer, limit: 8
  	add_column :bots, :kiffin_id, :integer, limit: 8
  end
end
