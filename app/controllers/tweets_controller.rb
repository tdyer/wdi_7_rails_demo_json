class TweetsController < ApplicationController

  def index
    home_tweets = TwitterClient.home_timeline.take(10)
    tweets = {} 
    home_tweets.each do |tweet|
      tweets[tweet.id] = {user: tweet.user.name.to_sym, content: tweet.text}
    end
    render json: tweets
  end
end
