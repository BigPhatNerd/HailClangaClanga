class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :friends_count
      t.integer :followers_count
      t.string :user_name

      t.timestamps
    end
  end
end
