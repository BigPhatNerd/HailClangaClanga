# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'


account_sid = ENV['account_sid']
auth_token = ENV['auth_token']

client = Twilio::REST::Client.new do |config|
	config.account_sid = ENV['account_sid']
	config.auth_token = ENV['auth_token']
end

#from = '+16172945705' # Your Twilio number
#to = '+19019213757' # Your mobile phone number
#client.messages.create(
#from: from,
#to: to,
#body: "Hey friend!"
#)