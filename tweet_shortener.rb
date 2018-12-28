require 'pry'

def dictionary
  {
    hello: "hi",
    to: "2",
    two: "2",
    too: "2",
    for: "4",
    four: "4",
    be: "b",
    you: "u",
    at: "@",
    and: "&"
  }
end

def word_substituter(tweet)
  keys = dictionary.keys
  tweet_array = tweet.split
  tweet_array.map! do |word|
    if keys.include?(word.downcase.to_sym)
      dictionary.fetch(word.downcase.to_sym)
    else
      word
    end
  end
  tweet_array.join(' ')
end

def bulk_tweet_shortener (tweets)
  tweets.each do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener (tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator (tweet)
  short_tweet = selective_tweet_shortener(tweet)
  if short_tweet.length > 140
    short_tweet.slice(1..140)
  else
    short_tweet
  end
end
