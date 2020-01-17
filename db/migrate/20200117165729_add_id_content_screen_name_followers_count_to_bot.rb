class AddIdContentScreenNameFollowersCountToBot < ActiveRecord::Migration[6.0]
  def change
  	add_column :bots, :tweet_id, :integer
  	add_column :bots, :content, :string
  	add_column :bots, :screen_name, :string
  	add_column :bots, :followers_count, :integer
  	add_column :bots, :description, :string
  	add_column :bots, :user_id, :integer
  	add_column :bots, :retweets, :integer
  end
end
