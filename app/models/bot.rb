class Bot < ApplicationRecord

	def self.hail_state_hashtag
		CLIENT.search("#hailstate -rt", since_id: maximum(:tweet_id), result_type: "mixed").take(10).each do |tweet|
			unless exists?(tweet_id: tweet.id)
				create!(
					tweet_id: tweet.id,
					content: tweet.text,
					screen_name: tweet.user.screen_name,
					followers_count: tweet.user.followers_count,
					description: tweet.user.description,
					user_id: tweet.user.id,
					retweets: tweet.retweet_count,
					)
			end

			user_name = tweet.user.name.downcase
			screen_name = tweet.user.screen_name.downcase
			user_description = tweet.user.description.downcase
			if ((screen_name.include? "hailstate") &&
				(user_name.include? "football")) || ((screen_name.include? "hailstate") &&
				(user_name.include? "hailstate")) ||((screen_name.include? "football") &&
				(user_name.include? "hailstate"))|| ((screen_name.include? "football") &&
				(screen_name.include? "hailstate")) || ((user_description.include? "football") &&
				(user_description.include? "hailstate")) &&
				(tweet.user.followers_count > 250) && (tweet.user.following? == false)

				CLIENT.follow("#{tweet.user.screen_name}")
			else
			end
		end
	end



	def self.mike_leach_hashtag
		CLIENT.search("Mike Leach #hailstate -rt", since_id: maximum(:tweet_id), result_type: "popular").take(10).each do |tweet|
			unless exists?(tweet_id: tweet.id)
				create!(
					tweet_id: tweet.id,
					content: tweet.text,
					screen_name: tweet.user.screen_name,
					followers_count: tweet.user.followers_count,
					description: tweet.user.description,
					user_id: tweet.user.id,
					retweets: tweet.retweet_count,
					)
			end
			text = tweet.text.downcase
			if((text.include? "mike leach") && (text.include? "hailstate")) ||
				((text.include? "mike leach") && (text.include? "love")) ||
				((text.include? "mike leach") && (text.include? "starkvegas")) ||
				((text.include? "swingyoursword") && (text.include? "hailstate"))

				CLIENT.follow("#{tweet.user.screen_name}")
			end
		end
	end

	def self.days_until_kickoff
		kickoff = Date.new(2020, 9, 5)
		egg_bowl = Date.new(2020, 11, 26)
		number_of_days =(kickoff - DateTime.now).to_i
		days_to_egg_bowl = (egg_bowl - DateTime.now).to_i
		weeks_until_kickoff = number_of_days/7
		weeks_until_eggbowl = days_to_egg_bowl/7
		day_of_week = DateTime.now.cwday

		if day_of_week == 6 && weeks_until_kickoff > 1
			CLIENT.update("#{weeks_until_kickoff} weeks until kickoff!\n#{weeks_until_eggbowl} weeks until Egg Bowl! 🥚🏆\nIt's gonna be 🔥.\n\n🐶 🏈 ⚔️ 🏴‍☠️🐮🔔 🎉\n#HailState #SwingYourSword")
		elsif day_of_week == 6 && weeks_until_kickoff == 1
			CLIENT.update("#{weeks_until_kickoff} week until kickoff!\nTime to get it done!.\n\n🐶 🏈 ⚔️🏴‍☠️ 🐮🔔 🎉\n#HailState #SwingYourSword")
		elsif day_of_week == 6 && weeks_until_kickoff == 0
			CLIENT.update("Game Day!!\nGet 'em 🐶's'\n\n🎉👏🍾🙌🎊🙏\n#HailState")
		elsif day_of_week == 4 && weeks_until_kickoff < 0 && weeks_until_eggbowl > 1
			CLIENT.update("#{weeks_until_eggbowl} weeks until Egg Bowl! 🥚🏆\nIt's gonna be 🔥. \n\n🐶 🏈 ⚔️ 🏴‍☠️🐮🔔 🎉\n#HailState #SwingYourSword")
		elsif weeks_until_eggbowl == 1
			CLIENT.update("#{weeks_until_eggbowl} week until Egg Bowl! 🥚🏆\nHoly Moly.\n\n🐶 🏈 ⚔️ 🏴‍☠️🐮🔔 🎉\n#HailState #SwingYourSword")
		elsif weeks_until_eggbowl == 0 && day_of_week == 4
			CLIENT.update("Happy Egg Bowl! 🥚🏆\nLeach vs Kiffin\nLet's do what we be doing!\n\n🐶 🏈 ⚔️ 🏴‍☠️🐮🔔 🎉\n#HailState #SwingYourSword")
		end

	end

	def self.friend_tweets
		CLIENT.friends.each do |friend|
			friend.tweet
			unless exists?(tweet_id: friend.tweet.id)
				create!(
					tweet_id: friend.tweet.id,
					content: friend.tweet.text,
					screen_name: friend.tweet.user.screen_name,
					followers_count: friend.tweet.user.followers_count,
					description: friend.tweet.user.description,
					user_id: friend.tweet.user.id,
					retweets: friend.tweet.retweet_count,
					)
			end
			unless friend.tweet.retweeted?
				tweet_text = friend.tweet.text.downcase
				if((tweet_text.include? "mike leach") && (tweet_text.include? "hailstate")) ||
					((tweet_text.include? "mike leach") && (tweet_text.include? "love")) ||
					((tweet_text.include? "mike leach") && (tweet_text.include? "starkvegas")) ||
					((tweet_text.include? "swingyoursword") && (tweet_text.include? "hailstate")) && 
					CLIENT.retweet(friend.tweet)
				elsif
					((tweet_text.include? "hailstate") &&
						(tweet_text.include? "football"))
					CLIENT.retweet(friend.tweet)
				elsif 
					(friend.tweet.user.screen_name == "@Coach_Leach")
					CLIENT.retweet(friend.tweet)
				end
			end

		end
	end
	
end
