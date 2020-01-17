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