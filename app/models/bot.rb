class Bot < ApplicationRecord
def self.search_words(words)
	CLIENT.search(words, lang: "en").first.text
end

def self.tweet(status)
CLIENT.update(status)
	end

end

words = [ 'your momma','#hailstate', 'whatever']
eachWord = words.each do |word|
	word
	end
test = Bot.search_words(words)
