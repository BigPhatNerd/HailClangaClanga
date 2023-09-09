desc "Looks for #hailstate tweets to follow"
task hail_state_search: :environment do
  puts "Searching for #hailstate tweets..."
  Bot.hail_state_hashtag
  puts "Hail State Search performed!"
end

desc "Looks for Zach Arnett tweets to follow"
task zach_arnett_search: :environment do
  puts "Searching for Zach Arnett tweets..."
  Bot.zach_arnett_hashtag
  puts "Zach Arnett Tweets Search performed!"
end

desc "Countdown to Football Season and Egg Bowl"
task countdown_to_kickoff: :environment do
  puts "Counting down days..."
  Bot.days_until_kickoff
  puts "Countdown Tweeted!"
end

desc "Re-tweeting Good Tweets."
task tweets_to_retweet: :environment do
  puts "Retweeting State tweets..."
  Bot.retweet
  puts "Re-tweeted those that I follow!"
end

desc "Lane Train trolling"
task lane_train: :environment do
  puts "Searching for #LaneTrain and #HottyToddy....."
  Bot.kiffin
  puts "Lane Train Performed"
end

desc "Friends and Followers"
task friends_and_followers: :environment do
  puts "Updating Friends & Followers page....."
  User.friends_and_followers
  puts "Friends and Followers Stats Updated"
end

desc "Generating friends and followers text"
task send_message: :environment do
  puts "Sending text message....."
  User.send_message
  puts "Text message sent!"
end

desc "Retweeting #hottypotty tweets"
task hottypotty: :environment do 
  puts "Retweeting #hottypotty..."
  Bot.hotty_potty
  puts "Hotty potty tweets sent"
end

