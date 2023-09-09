

class Bot < ApplicationRecord


  def self.hail_state_hashtag
    count = 0

    CLIENT.search("#hailstate").take(5).each do |tweet|
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


  def self.zach_arnett_hashtag
    count = 0
    CLIENT.search("Zach Arnett #hailstate").take(12).each do |tweet|
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
      if(((text.include? "zach arnett") && (text.include? "hailstate")) ||
        (text.include? "kevin barbay") && (text.include? "hailstate")) ||
         ((text.include? "@CoachZachArnett") && (text.include? "#hailstate")) 
         ((text.include? "zach arnett") && (text.include? "starkvegas")) ||
         ((text.include? "@CoachZachArnett") && (text.include? "starkvegas")) )
        count += 1
        puts "Follow person with Zach Arnett tweet\n
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
        puts "DID NOT FOLLOW Zach Arnett tweet"
      end

    end
  end

  def self.days_until_kickoff
    kickoff = Date.new(2022, 9, 3)
    egg_bowl = Date.new(2023, 11, 23)
    number_of_days =((kickoff + 1) - DateTime.now).to_i
    days_to_egg_bowl = ((egg_bowl + 1) - DateTime.now).to_i
    weeks_until_kickoff = number_of_days/7
    weeks_until_eggbowl = days_to_egg_bowl/7
    
    if  weeks_until_kickoff > 1
      CLIENT.update("#{weeks_until_kickoff} weeks (#{number_of_days} days) until kickoff!\n#{weeks_until_eggbowl} weeks (#{days_to_egg_bowl} days) until Egg Bowl! 🥚🏆\n\n🐶 🏈 ⚔️ 🐮🔔 🎉\n#HailState")
    elsif  weeks_until_kickoff == 1
      CLIENT.update("#{weeks_until_kickoff} week (#{number_of_days} days) until kickoff!\n#{weeks_until_eggbowl} weeks (#{days_to_egg_bowl} days) until Egg Bowl! 🥚🏆Time to get it done!.\n\n🐶 🏈 ⚔️ 🐮🔔 🎉\n#HailState")
    elsif  weeks_until_eggbowl > 1

      CLIENT.update("#{weeks_until_eggbowl} weeks (#{days_to_egg_bowl} days) until Egg Bowl! 🥚🏆\n\n🐶 🏈 ⚔️ 🐮🔔 🎉\n#HailState")
    
    elsif weeks_until_eggbowl == 1
      CLIENT.update("#{weeks_until_eggbowl} week (#{days_to_egg_bowl} days) until Egg Bowl! 🥚🏆\nHoly Moly.\n\n🐶 🏈 ⚔️ 🐮🔔 🎉\n#HailState")
    elsif weeks_until_eggbowl == 0 &&  days_to_egg_bowl > 0
      CLIENT.update("#{days_to_egg_bowl} days until Egg Bowl! 🥚🏆\nHoly Moly.\n\n🐶 🏈 ⚔️ 🐮🔔 🎉\n#HailState")
    elsif weeks_until_eggbowl == 0 && days_to_egg_bowl == 0
      CLIENT.update("Happy Egg Bowl! 🥚🏆\nArnett vs Kiffin\nLet's do what we be doing!\n\n🐶 🏈 ⚔️ 🐮🔔 🎉\n#HailState")
    end

  end

  def self.retweet
    count = 0
    CLIENT.search("#hailstate", result_type: "recent", since_id: maximum(:retweets_id)).take(5).each do |tweet|

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


      tweet_text = tweet.text.downcase
      if (tweet.in_reply_to_status_id? == false)
                if (tweet_text.downcase.include? "zach arnett") || (tweet_text.downcase.include? "percy lewis")  ||  (tweet_text.downcase.include? "will rogers") || (tweet_text.downcase.include? "jaden crumedy") ||
          (tweet_text.downcase.include? "sack") || (tweet_text.downcase.include? "passing") || (tweet_text.downcase.include? "tulu griffin") || (tweet_text.downcase.include? "dillon johnson") || 
          (tweet_text.downcase.include? "jaden walley")  || (tweet_text.downcase.include? "marcus banks") || (tweet_text.downcase.include? "woody marks") || (tweet_text.downcase.include? "jo'quavious marks") || (tweet_text.downcase.include? "emmanuel forbes") || 
          (tweet_text.downcase.include? "nathaniel watson") || (tweet_text.downcase.include? "simeon price") || (tweet_text.downcase.include? "creed whittemore") || (tweet_text.downcase.include? "mike wright") || (tweet_text.downcase.include? "jeffery pittman") || 
          (tweet_text.downcase.include? "cameron young") || (tweet_text.downcase.include? "justin robinson") || (tweet_text.downcase.include? "jett johnson") || (tweet_text.downcase.include? "kalvin dinkins") || (tweet_text.downcase.include? "kyle ferrie") || 
          (tweet_text.downcase.include? "nathan pickering") || (tweet_text.downcase.include? "jaden crumedy") || (tweet_text.downcase.include? "trevion williams") || (tweet_text.downcase.include? "nic mitchell") || (tweet_text.downcase.include? "jacarius clayton") || 
          (tweet_text.downcase.include? "de'monte russell") || (tweet_text.downcase.include? "zavion thomas") || (tweet_text.downcase.include? "jordan morant") || (tweet_text.downcase.include? "hunter washington") || (tweet_text.downcase.include? "justin robinson") || 
          (tweet_text.downcase.include? "nic mitchell") || (tweet_text.downcase.include? "marcus banks")
          count += 1
          puts "MATCHES RETWEET PARAMETERS\n
          ________________________"
          begin
            CLIENT.retweet!(tweet)
          rescue Twitter::Error::Forbidden
            puts "Error:#{Twitter::Error::Forbidden}"
            puts "-----RESCUED-----"
          end
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
      elsif (tweet_text.include? "zach arnett")   ||  (tweet_text.include? "will rogers") || (tweet_text.include? "davis wade") ||
          (tweet_text.include? "sack") || (tweet_text.include? "passing") 
          count += 1
          puts "MATCHES RETWEET PARAMETERS\n
          ________________________"
          begin
            CLIENT.retweet!(tweet)
          rescue Twitter::Error::Forbidden
            puts "Error:#{Twitter::Error::Forbidden}"
            puts "-----RESCUED-----"
          end
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

        elsif (tweet.user.screen_name == "@CoachZachArnett") || (tweet.user.screen_name == "@HailStateFB") ||
            (tweet_text.include? "@hailstatefb") || (tweet_text.include? "@CoachZachArnett") ||
            (tweet_text.include? "coach arnett")
          count += 1
          puts "MATCHES RETWEET PARAMETERS\n
          ________________________"
          begin
            CLIENT.retweet!(tweet)
          rescue Twitter::Error::Forbidden
            puts "Error:#{Twitter::Error::Forbidden}"
            puts "-----RESCUED-----"
          end
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
    CLIENT.search("#LaneTrain", result_type: "recent", since_id: maximum(:kiffin_id)).take(5).each do |tweet|
      break if count > 0
      puts "I am tweet id: #{tweet.id}"
      if exists?(tweet_id: tweet.id)
        puts "This already exists so I am leaving"
      end

      bullet = gif_array.shuffle!.first
      puts "Bullet: #{bullet}"
      shot_fired = File.new(bullet)
      begin
        puts "Updating with #{bullet}"

        CLIENT.update_with_media("@#{tweet.user.screen_name} Did you say \"Lane Train\"?\n", shot_fired,in_reply_to_status_id: tweet.id)
        count += 1
      rescue
        puts "----FORBIDDEN---"
        count = 0
        puts "Error:#{Twitter::Error::Forbidden}"
        Twitter::Error::Forbidden
      end
      unless exists?(tweet_id: tweet.id)
        puts "DOES NOT EXISTS"
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

  def self.hotty_potty
    count = 0
    CLIENT.search("#hottypotty", result_type: "recent", since_id: maximum(:hotty_potty_id)).take(9).each do |tweet|
      break if count > 2
      puts "I am tweet id: #{tweet.id}"
      tweet_text = tweet.text.downcase
      if (tweet.in_reply_to_status_id? == false)
        if (tweet_text.include? "#hottypotty")
      begin
        CLIENT.retweet!(tweet)
        count += 1
      rescue Twitter::Error::Forbidden
        puts "Error:#{Twitter::Error::Forbidden}"
        puts "-----RESCUED-----"
      end
      unless exists?(tweet_id: tweet.id)
        create!(
          tweet_id: tweet.id,
          hotty_potty_id: tweet.id,
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
end
    end

  end

end
