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
      puts tweet.text
      puts "-----"
      puts tweet.user.screen_name
      puts "-----"
      puts tweet.user.description
      puts tweet.user.followers_count
      puts "----------"
      if ((tweet.user.screen_name.downcase.include? "hailstate") &&
        (tweet.user.name.downcase.include? "football")) || ((tweet.user.screen_name.downcase.include? "hailstate") &&
        (tweet.user.name.downcase.include? "hailstate")) ||((tweet.user.screen_name.downcase.include? "football") &&
        (tweet.user.name.downcase.include? "hailstate"))|| ((tweet.user.description.downcase.include? "football") &&
        (tweet.user.screen_name.downcase.include? "hailstate")) || ((tweet.user.description.downcase.include? "football") &&
        (tweet.user.description.downcase.include? "hailstate")) &&
          (tweet.user.followers_count > 250) && (tweet.user.following? == false)

        CLIENT.follow("#{tweet.user.screen_name}")
        puts "GONNA FOLLOW"
      else

        puts "DOESN'T QUALIFY"
      end
      #CLIENT.retweet(tweet)

    end
  end

  def self.mike_leach_hashtag
    CLIENT.search("Mike Leach #hailstate -rt",result_type: "mixed").take(10).each do |tweet|
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
      puts tweet.text
      puts "-----"
      puts tweet.user.screen_name
      puts "-----"
      puts tweet.user.description
      puts tweet.user.followers_count
      puts "----------"
      if((tweet.text.downcase.include? "mike leach") && (tweet.text.downcase.include? "hailstate")) ||
          ((tweet.text.downcase.include? "mike leach") && (tweet.text.downcase.include? "love")) ||
          ((tweet.text.downcase.include? "mike leach") && (tweet.text.downcase.include? "starkvegas")) ||
          ((tweet.text.downcase.include? "swingyoursword") && (tweet.text.downcase.include? "hailstate"))

        CLIENT.follow("#{tweet.user.screen_name}")
        puts "GONNA FOLLOW"
      else

        puts "DOESN'T QUALIFY"
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
     CLIENT.update("#{weeks_until_kickoff} weeks until kickoff!
	 	#{weeks_until_eggbowl} weeks until Egg Bowl! 🥚🏆
		🐶 🏈 ⚔️ 🏴‍☠️🐮🔔 🎉 
		It's gonna be 🔥. 
	    #HailState #SwingYourSword")  
    elsif day_of_week == 6 && weeks_until_kickoff == 1
      CLIENT.update("#{weeks_until_kickoff} week until kickoff!
		🐶 🏈 ⚔️🏴‍☠️ 🐮🔔 🎉 
		Time to get it done!. 
		#HailState #SwingYourSword")  
    elsif day_of_week == 6 && weeks_until_kickoff == 0
      CLIENT.update("Game Day!!
		Get 'em 🐶's'
    	🎉👏🍾🙌🎊🙏
		#HailState")
	elsif day_of_week == 4 && weeks_until_kickoff < 0 && weeks_until_eggbowl > 1 
	 	CLIENT.update("#{weeks_until_eggbowl} weeks until Egg Bowl! 🥚🏆}
		🐶 🏈 ⚔️ 🏴‍☠️🐮🔔 🎉 
		It's gonna be 🔥. 
		#HailState #SwingYourSword")
	elsif weeks_until_eggbowl == 1
	 	CLIENT.update("#{weeks_until_eggbowl} week until Egg Bowl! 🥚🏆}
		🐶 🏈 ⚔️ 🏴‍☠️🐮🔔 🎉 
		Holy Moly. 
		#HailState #SwingYourSword")
	elsif weeks_until_eggbowl == 0 && day_of_week == 4
		CLIENT.update("Happy Egg Bowl! 🥚🏆
		Leach vs Kiffin
		Let's do what we be doing!
		🐶 🏈 ⚔️ 🏴‍☠️🐮🔔 🎉  
		#HailState #SwingYourSword") 	 
    end

  end
end
