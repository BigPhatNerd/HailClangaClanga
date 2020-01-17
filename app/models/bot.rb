class Bot < ApplicationRecord

=begin
	{
		:created_at=>"Thu Jan 16 16:56:59 +0000 2020", 
		:id=>1217853263057506306, 
		---:id_str=>"1217853263057506306", 
		:text=>"Thursday Nights + @HailStateWBK = \nA collectible cup giveaway!", 
		:truncated=>true, 
		:entities=>{
			:hashtags=>[], 
			:symbols=>[], 
			:user_mentions=>[
				{
					:screen_name=>"HailStateWBK", 
					:name=>"Mississippi State WBK", 
					:id=>157412251, 
					:id_str=>"157412251", 
					:indices=>[18, 31]
				}], 
				:urls=>[
					{
						:url=>"https://t.co/9gdTyZKbRp", 
						:expanded_url=>"https://twitter.com/i/web/status/1217853263057506306", 
						:display_url=>"twitter.com/i/web/status/1…", 
						:indices=>[108, 131]
					}]
				}, 
		:metadata=>{:iso_language_code=>"en", :result_type=>"recent"}, 
		:source=>"<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>", 
		:in_reply_to_status_id=>nil, 
		:in_reply_to_status_id_str=>nil, 
		:in_reply_to_user_id=>nil, 
		:in_reply_to_user_id_str=>nil, 
		:in_reply_to_screen_name=>nil, 
		:user=>{
			:id=>61490312, 
			:id_str=>"61490312", 
			:name=>"Mississippi State Marketing", 
			:screen_name=>"HailStateMKTG", 
			:location=>"Starkville, MS", 
			:description=>"The official Twitter account for the Mississippi State Athletics Marketing Department.", 
			:url=>"https://t.co/UFGzGvYFMc", 
			:entities=>{
				:url=>{
					:urls=>[{
						:url=>"https://t.co/UFGzGvYFMc", 
						:expanded_url=>"http://www.HailState.com", 
						:display_url=>"HailState.com", 
						:indices=>[0, 23]}
					]}, 
					:description=>{:urls=>[]}
						}, 
			:protected=>false, 
			:followers_count=>13337, 
			:friends_count=>71, 
			:listed_count=>126, 
			:created_at=>"Thu Jul 30 13:43:03 +0000 2009", 
			:favourites_count=>1086, 
			:utc_offset=>nil, 
			:time_zone=>nil, 
			:geo_enabled=>true, 
			:verified?=>true, 
			:statuses_count=>4856, 
			:lang=>nil, 
			:default_profile=>false, 
			:default_profile_image=>false, 
			:following=>false, 
			:follow_request_sent=>false, 
			:is_quote_status=>false, 
			:retweet_count=>0, 
			:favorite_count=>0, 
			:favorited=>false, 
			:retweeted=>false, 
			:lang=>"en"
			}
=end

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

#missippistatefootball

end
