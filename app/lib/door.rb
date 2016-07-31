module Door
  module_function

  def open
    redis_client = Redis.new
    redis_client.publish(ENV['CHANNEL'], ENV['OPEN_SESAME'] || "meow")
  end
end