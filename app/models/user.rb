class User < ApplicationRecord


  def self.update

begin
            user_followers = CLIENT.followers.count
            sleep(6)
          rescue
            puts "********************\n
            FOLLOWERS NEEDED TO BE RESCUED\n
            *********************"
            Twitter::Error::Forbidden
          end
begin
            user_friends = CLIENT.friends.count
          rescue
            puts "********************\n
            FRIENDS NEEDED TO BE RESCUED\n
            *********************"
            Twitter::Error::Forbidden
          end


create!({ 
	followers_count: user_followers,
	friends_count: user_friends
})
  end

  def self.friends_and_followers  	
  	 x = CLIENT.user("HailClangaClang").followers_count
  	 y = CLIENT.user("HailClangaClang").friends_count
create!({ 
	followers_count: x,
	friends_count: y
})
  end

  def self.create_message
 yesterday_friends = 277 
     yesterday_follows = 80 
     User.order("created_at desc").each do |user| 
    
        x = Time.at(user.created_at).to_i 
message ="Date: #{Time.at(x).strftime("%B %e, %Y at %I:%M %c")}\n        
Friends count: #{user.friends_count}\n 
 🎉🙏🎊🙌🍾       
Friends gained from yesterday: #{user.friends_count - yesterday_friends}\n   
 ☝️🆙⬆️⬆📈☝       
Followers count: #{user.followers_count}\n
😎🍻😛🥳   
Folowers gained from yesterday: #{user.followers_count - yesterday_follows}\n    
🤜🤛💃🕺🐸     
Followers to follow ratio: #{((user.followers_count.to_f / user.friends_count.to_f) * 100).round}%\n
🗽🎁📣🔮⚙️"
         yesterday_friends = user.friends_count 
         yesterday_follows = user.followers_count 
    return message
     end 


  end
  def self.send_message
    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']
   twilio = Twilio::REST::Client.new(account_sid, auth_token)
    from = '+16172945705' # Your Twilio number
to = '+19019213757'
twilio.messages.create(
from: from,
to: to,
body: "HailClangaClang's Twitter Report:\n\n#{self.create_message}"
)
  end
end

