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
end

