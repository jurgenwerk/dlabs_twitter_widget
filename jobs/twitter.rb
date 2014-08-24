require 'twitter'

#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
client = Twitter::REST::Client.new do |config|
  config.consumer_key = ''
  config.consumer_secret = ''
  config.access_token = ''
  config.access_token_secret = ''
end

SCHEDULER.every '2m' do
  begin
    tweets = client.user_timeline("dlabs_si")
    tweet = tweets.first
    send_event('tweet', { user: tweet.user.name, tweet: tweet.text, 
      avatar_image: tweet.user.profile_image_url_https, created_at: tweet.created_at })
  rescue Twitter::Error
    puts "Twitter fail."
  end
end
