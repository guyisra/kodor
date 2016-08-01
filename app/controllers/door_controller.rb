class DoorController < ApplicationController

  def open
    return head :unauthorized unless current_user.andand.can_open?
    Door.open
    Slacknotifier.new.speak("#{current_user} has entered the office.")

    head :ok
  end
end
