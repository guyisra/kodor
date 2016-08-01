class DoorController < ApplicationController

  def open
    return head :unauthorized unless current_user.andand.can_open?
    Door.open

    head :ok
  end
end
