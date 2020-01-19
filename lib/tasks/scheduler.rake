desc "Looks for #hailstate tweets to follow"
task hail_state_search: :environment do
  puts "Searching for #hailstate tweets..."
  Bot.hail_state_hashtag
  puts "Hail State Search performed!"
end

desc "Looks for Mike Leach tweets to follow"
task mike_leach_search: :environment do
  puts "Searching for Mike Leach tweets..."
  Bot.mike_leach_hashtag
  puts "Mike Leach Tweets Search performed!"
end

desc "Countdown to Football Season and Egg Bowl"
task countdown_to_kickoff: :environment do
  puts "Counting down days..."
  Bot.days_until_kickoff
  puts "Countdown Tweeted!"
end

desc "Re-tweeting those that I follow."
task retweet_friend_tweets: :environment do
  puts "Retweeting friend's tweets..."
  Bot.friend_tweets
  puts "Re-tweeted those that I follow!"
end

