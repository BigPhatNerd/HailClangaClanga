class User < ApplicationRecord


  def self.friends_and_followers  	
  	 x = CLIENT.user("HailClangaClang").followers_count
  	 y = CLIENT.user("HailClangaClang").friends_count
create!({ 
	followers_count: x,
	friends_count: y
})
  end

  def self.create_message
 friendsArr = [0] 
     followersArr = [0] 
     User.order("created_at asc").each do |user| 
    friendsArr.push(user.friends_count)
    followersArr.push(user.followers_count)   
     end 
x = Time.now
message ="Date: #{Time.at(x).strftime("%B %c")
}\n        
Friends count: #{friendsArr[-1]}\n 
 🎉🙏🎊🙌🍾       
Friends gained from yesterday: #{friendsArr[-1] - friendsArr[-2]}\n   
 ☝️🆙⬆️⬆📈☝ \n      
Followers count: #{followersArr[1]}\n
😎🍻😛🥳   
Folowers gained from yesterday: #{followersArr[-1] - followersArr[-2]}\n    
🤜🤛💃🕺🐸\n     
Followers to follow ratio: #{((followersArr[-1].to_f / friendsArr[-1].to_f) * 100).round}%\n
🗽🎁📣🔮⚙️"
         
    return message

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

