require 'json'

module Door
  module_function

  def open(username)
    redis_client = Redis.new
    data = {top_secert: ENV['OPEN_SESAME'], username: username}
    redis_client.publish(ENV['CHANNEL'], data.to_json || "meow")
  end
end