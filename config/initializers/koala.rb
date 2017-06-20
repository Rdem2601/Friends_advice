

Koala.configure do |config|
  # config.access_token = ENV["#{current_user.token}"]
  config.app_access_token = ENV["MY_APP_ACCESS_TOKEN"]
  config.app_id = ENV["FB_ID"]
  config.app_secret = ENV["FB_SECRET"]
end
