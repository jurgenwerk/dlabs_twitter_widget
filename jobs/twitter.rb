require 'twitter'

#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
client = Twitter::REST::Client.new do |config|
  config.consumer_key = 'VSfbLVRiTjsIKzJnQqxBQ'
  config.consumer_secret = 'p7ZuIr5NKyRcCe9aKY1qU9YXQhkB1ohVweQNp91Bq0'
  config.access_token = '60061639-s2X26FcxaoI1YwKpbD3ScTHhHSIo9yPwi5jQ0AzTF'
  config.access_token_secret = 'GDVzq58rujvlizyzw8y0jNH0PUwM8LpZm34ZZ86wbZpOH'
end

SCHEDULER.every '15s' do
  begin
    tweets = client.user_timeline("dlabs_si")
    tweet = tweets.first
    send_event('tweet', { user: tweet.user.name, tweet: tweet.text, 
      avatar_image: tweet.user.profile_image_url_https, created_at: tweet.created_at })
  rescue Twitter::Error
    puts "Twitter fail."
  end
end