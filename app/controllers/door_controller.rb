class DoorController < ApplicationController

  def open
    return head :unauthorized unless current_user.andand.can_open?

    redis_client = Redis.new
    redis_client.publish(ENV['CHANNEL'], ENV['OPEN_SESAME'] || "meow")

    head :ok
  end
end
