desc "Looks for #hailstate tweets to follow"
task hail_state_search: :environment do
  puts "Searching for #hailstate tweets..."
  Bot.hail_state_hashtag
  puts "Search performed!"
end

desc "Looks for Mike Leach tweets to follow"
task mike_leach_search: :environment do
  puts "Searching for #hailstate tweets..."
  Bot.mike_leach_hashtag
  puts "Search performed!"
end

desc "Countdown to Football Season and Egg Bowl"
task countdown_to_kickoff: :environment do
  puts "Counting down days..."
  Bot.days_until_kickoff
  puts "Countdown Tweeted!"
end

