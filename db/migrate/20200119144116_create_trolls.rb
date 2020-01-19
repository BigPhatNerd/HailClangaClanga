class CreateTrolls < ActiveRecord::Migration[6.0]
  def change
    create_table :trolls do |t|
      t.string :message

      t.timestamps
    end
  end
end
