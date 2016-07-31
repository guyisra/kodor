class DoorController < ApplicationController

  def open
    redis_client = Redis.new
    redis_client.publish(ENV['CHANNEL'], { msg: 'Open door' }.to_json)

    head :ok
  end
end
