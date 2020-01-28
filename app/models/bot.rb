

class Bot < ApplicationRecord


  def self.hail_state_hashtag
    count = 0

    CLIENT.search("#hailstate").take(15).each do |tweet|
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
      puts "#{tweet.text}\n
      ________________________\n
      Tweet id: #{tweet.id}\n
      ________________________
     Count is: #{count}"
      text = tweet.text.downcase
      user_name = tweet.user.name.downcase
      screen_name = tweet.user.screen_name.downcase
      user_description = tweet.user.description.downcase
      if (screen_name.include? "hailstate") || (text.include? "#hailstate") ||

          (user_name.include? "hailstate") || (user_name.include? "mississippi state") ||
          (user_description.include?"mississippi state") || (user_description.include? "hailstate") || (user_description.include? "mississippi state") &&
          (tweet.user.followers_count > 100) && (tweet.user.following? == false)
          count += 1
        puts "________________________\n
        Follow person with #HailState tweet\n
       ________________________\n

        Count is #{count}"
        begin
            CLIENT.follow("#{tweet.user.screen_name}")
          rescue
            puts "********************\n
            NEEDED TO BE RESCUED\n
            *********************"
            Twitter::Error::Forbidden
          end
      else
      	count += 1

        puts "DID NOT FOLLOW #HailState tweet"

        puts "Count is #{count}"
      end
    end
  end


  def self.mike_leach_hashtag
    count = 0
    CLIENT.search("Mike Leach #hailstate").take(12).each do |tweet|
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
      puts "#{tweet.text}\n
      ________________________\n
      This is the tweet id: #{tweet.id}\n
      ________________________\n
      Count is: #{count}\n
      ________________________"
      text = tweet.text.downcase
      if(((text.include? "mike leach") && (text.include? "hailstate")) ||
         ((text.include? "@coach_leach") && (text.include? "#hailstate")) ||
         ((text.include? "mike leach") && (text.include? "love")) ||
         ((text.include? "@coach_leach") && (text.include? "love")) ||
         ((text.include? "mike leach") && (text.include? "starkvegas")) ||
         ((text.include? "@coach_leach") && (text.include? "starkvegas")) ||
         ((text.include? "mike leach") && (text.include? "air raid")) ||
         ((text.include? "@coach_leach") && (text.include? "air raid")) ||
         ((text.include? "swingyoursword") && (text.include? "hailstate")) ||
         ((text.include? "pirate") && (text.include? "hailstate")))
      count += 1
        puts "Follow person with Mike Leach tweet\n
        ________________________"
        
        begin
            CLIENT.follow("#{tweet.user.screen_name}")
          rescue
            puts "********************\n
            NEEDED TO BE RESCUED\n
            *********************"
            Twitter::Error::Forbidden
          end
      else
      	count += 1
        puts "DID NOT FOLLOW Mike Leach tweet"
      end

    end
  end

  def self.days_until_kickoff
    kickoff = Date.new(2020, 9, 5)
    egg_bowl = Date.new(2020, 11, 26)
    number_of_days =((kickoff + 1) - DateTime.now).to_i
    days_to_egg_bowl = ((egg_bowl + 1) - DateTime.now).to_i
    weeks_until_kickoff = number_of_days/7
    weeks_until_eggbowl = days_to_egg_bowl/7
    day_of_week = DateTime.now.cwday
day = {
0 => "It's gonna be 🥜",
1 =>  "I bet we throw once or twice",
2 =>  "@H_Kylin is going to decleat folks",
3 => "I'm having a hard time waiting",
4 =>  "Best👏season👏ever👏.",
5 => "I just don't know what to say.",
6 => "Crunk is probably accurate"
}
    if  weeks_until_kickoff > 1
      CLIENT.update("#{weeks_until_kickoff} weeks (#{number_of_days} days) until kickoff!\n#{weeks_until_eggbowl} weeks (#{days_to_egg_bowl} days) until Egg Bowl! 🥚🏆\n#{day[day_of_week]}\n\n🐶 🏈 ⚔️ 🏴‍☠️🐮🔔 🎉\n#HailState #SwingYourSword")
    elsif  weeks_until_kickoff == 1
      CLIENT.update("#{weeks_until_kickoff} week (#{number_of_days}) until kickoff!\n#{weeks_until_eggbowl} weeks (#{days_to_egg_bowl}) until Egg Bowl! 🥚🏆Time to get it done!.\n\n🐶 🏈 ⚔️🏴‍☠️ 🐮🔔 🎉\n#HailState #SwingYourSword")
    elsif d weeks_until_kickoff == 0
      CLIENT.update("Game Day!!\nGet 'em 🐶's\n\n🎉👏🍾🙌🎊🙏\n#HailState")
    elsif  weeks_until_kickoff < 0 && weeks_until_eggbowl > 1
      CLIENT.update("#{weeks_until_eggbowl} weeks (#{days_to_egg_bowl} days) until Egg Bowl! 🥚🏆\n#{day[day_of_week]} \n\n🐶 🏈 ⚔️ 🏴‍☠️🐮🔔 🎉\n#HailState #SwingYourSword")
    elsif weeks_until_eggbowl == 1
      CLIENT.update("#{weeks_until_eggbowl} week (#{days_to_egg_bowl} days) until Egg Bowl! 🥚🏆\nHoly Moly.\n\n🐶 🏈 ⚔️ 🏴‍☠️🐮🔔 🎉\n#HailState #SwingYourSword")
    elsif weeks_until_eggbowl == 0 && days_to_egg_bowl == 0
      CLIENT.update("Happy Egg Bowl! 🥚🏆\nLeach vs Kiffin\nLet's do what we be doing!\n\n🐶 🏈 ⚔️ 🏴‍☠️🐮🔔 🎉\n#HailState #SwingYourSword")
    end

  end

  def self.retweet
    count = 0
    CLIENT.search("#hailstate", since_id: maximum(:retweets_id)).take(9).each do |tweet|
    	
      puts "Name: #{tweet.user.name}\n
      ________________________\n			
      Screen Name: #{tweet.user.screen_name}\n
      ________________________\n			
      Tweet text: #{tweet.text}\n
      ________________________\n			
      Retweet Count: #{tweet.retweet_count}\n
      ________________________			
      Favorites Count: #{tweet.favorite_count}\n
      ________________________\n			
      I have already retweeted this? #{tweet.retweeted?}\n
      ----------------------------------\n
      Count is: #{count}\n
      ________________________"
      unless exists?(tweet_id: tweet.id)
        create!(
          tweet_id: tweet.id,
          retweets_id: tweet.id,
          content: tweet.text,
          screen_name: tweet.user.screen_name,
          followers_count: tweet.user.followers_count,
          description: tweet.user.description,
          user_id: tweet.user.id,
          retweets: tweet.retweet_count,
        )
      end
      
      tweet_text = tweet.text.downcase
      if (tweet.in_reply_to_status_id? == false)
        if (tweet_text.include? "mike leach") || (tweet_text.include? "swingyoursword") 
            count += 1
          puts "MATCHES RETWEET PARAMETERS\n
          ________________________"
          begin
            CLIENT.retweet!(tweet)
            rescue Twitter::Error::Forbidden
              puts "Error:#{Twitter::Error::Forbidden}"
              puts "-----RESCUED-----"
            end
          
        elsif (tweet_text.include? "football") || (tweet_text.include? "lineman") ||  
          (tweet_text.include? "quarterback") || (tweet_text.include? "receiver")  || 
          (tweet_text.include? "qb") || (tweet_text.include? " mississippi state football") 
           
            count += 1
          puts "MATCHES RETWEET PARAMETERS\n
         ________________________"
          begin
            CLIENT.retweet!(tweet)
            rescue Twitter::Error::Forbidden
              puts "Error:#{Twitter::Error::Forbidden}"
              puts "-----RESCUED-----"
            end
          
        elsif (tweet.user.screen_name == "@Coach_Leach") || (tweet.user.screen_name == "@HailStateFB") || 
              (tweet_text.include? "@hailstatefb") || (tweet_text.include? "@coach_leach") || 
              (tweet_text.include? "coach leach")
          count += 1
          puts "MATCHES RETWEET PARAMETERS\n
          ________________________"
          begin
            CLIENT.retweet!(tweet)
            rescue Twitter::Error::Forbidden
              puts "Error:#{Twitter::Error::Forbidden}"
              puts "-----RESCUED-----"
            end
          
        elsif (tweet_text.include? "#gthom")
        	count += 1
          puts "MATCHES RETWEET PARAMETERS\n
          ________________________"
          begin
            CLIENT.retweet!(tweet)
            rescue Twitter::Error::Forbidden
              puts "Error:#{Twitter::Error::Forbidden}"
              puts "-----RESCUED-----"
            end
          
        elsif (tweet_text.include? "kylin") || (tweet_text.include? "chauncey") ||
            (tweet_text.include? "darryl williams") || (tweet_text.include? "osirus") ||
            (tweet_text.include? "stephen guidry") 
            count += 1
          puts "MATCHES RETWEET PARAMETERS\n
          ________________________"
          begin
            CLIENT.retweet!(tweet)
            rescue Twitter::Error::Forbidden
             puts "Error:#{Twitter::Error::Forbidden}" 
              puts "-----RESCUED-----"
            end
          
        else
        	count += 1
          puts "*******NOT RETWEETED******\n
          ________________________"
        end
      end
    end
  end


  def self.kiffin
 gif_array =   ["app/assets/images/anotherdisaster.gif",
"app/assets/images/barf.gif",
"app/assets/images/disaster.gif",
"app/assets/images/disaster2.gif",
"app/assets/images/disaster3.gif",
"app/assets/images/future.gif",
"app/assets/images/giphy.gif",
"app/assets/images/giphy2.gif",
"app/assets/images/giphy3.gif",
"app/assets/images/hotmess.gif",
"app/assets/images/hotmess2.gif",
"app/assets/images/miley.gif",
"app/assets/images/ohdear.gif",
"app/assets/images/push.gif",
"app/assets/images/train.gif",
"app/assets/images/train2.gif",
"app/assets/images/train3.gif",
"app/assets/images/train4.gif",
"app/assets/images/train5.gif",
"app/assets/images/train6.gif",
"app/assets/images/train7.gif",
"app/assets/images/usc.gif",
"app/assets/images/wreck.gif"]

count = 0
  CLIENT.search("#LaneTrain", since_id: maximum(:kiffin_id)).take(5).each do |tweet|
    break if count > 0
puts "I am tweet id: #{tweet.id}" 
if exists?(tweet_id: tweet.id)
  puts "This already exists so I am leaving"
end
unless exists?(tweet_id: tweet.id)
      puts tweet.attrs
      puts "DOES NOT EXISTS"
      
      
      bullet = gif_array.shuffle!.first
      puts "Bullet: #{bullet}"
      shot_fired = File.new(bullet)
      begin
        puts "Updating with #{bullet}"
        
      CLIENT.update_with_media("@#{tweet.user.screen_name} Did you say \"Lane Train\"?\n😂🤷‍♂️🥚🥣🏆🐶🏴‍☠️🙌\n😔🦈🐻🚂🤭", shot_fired,in_reply_to_status_id: tweet.id)
      count += 1
    rescue
      puts "----FORBIDDEN---"
      count = 0
      puts "Error:#{Twitter::Error::Forbidden}" 
      Twitter::Error::Forbidden
    end    
      puts "#{tweet.id} GOING TO PUT IN DATABASE NOW"
        create!(
          tweet_id: tweet.id,
          kiffin_id: tweet.id,
          content: tweet.text,
          screen_name: tweet.user.screen_name,
          followers_count: tweet.user.followers_count,
          description: tweet.user.description,
          user_id: tweet.user.id,
          retweets: tweet.retweet_count,
        )
        end
      end
      puts "COUNT IS: #{count}"

  end



end

