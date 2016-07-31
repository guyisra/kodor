class DoorController < ApplicationController
  def open
    return head :unauthorized unless current_user
    Door.open

    head :ok
  end
end
