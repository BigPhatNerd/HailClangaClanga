# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class AddInitialBots < ActiveRecord::Migration[5.0]
  def up
    5.times do |i|
      Bot.create!(id: i, tweet_id: 12182144535455537536, content: "Testing", screen_name: "Testing", followers_count: 300, description: "Testing", user_id: 3434344334, retweets:5)
    end
  end

  def down
   Bot.delete_all
  end
end