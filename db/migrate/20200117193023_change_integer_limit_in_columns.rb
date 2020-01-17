class ChangeIntegerLimitInColumns < ActiveRecord::Migration[6.0]
  def change
  	change_column :bots, :tweet_id, :integer, limit: 8
  	change_column :bots, :user_id, :integer, limit: 8
  end
end
