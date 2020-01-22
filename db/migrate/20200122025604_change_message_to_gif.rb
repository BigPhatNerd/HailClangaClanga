class ChangeMessageToGif < ActiveRecord::Migration[6.0]
  def change
  	rename_column :trolls, :message, :gif
  end
end
