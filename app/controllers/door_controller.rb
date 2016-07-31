class DoorController < ApplicationController

  def open
    return head :unauthorized unless current_user
    redis_client = Redis.new
    redis_client.publish(ENV['CHANNEL'], { msg: 'Open door' }.to_json)

    head :ok
  end
end
