class DoorController < ApplicationController
  def open
    return head :unauthorized unless current_user.andand.can_open?
    Door.open(current_user.name)
    Slacknotifier.new.speak("#{current_user.name} has entered the office.") if current_user.provider == 'Klarna'

    head :ok
  end
end
