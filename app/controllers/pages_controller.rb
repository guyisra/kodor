class PagesController < ApplicationController
  def index

  end

  def open
    if current_user.andand.can_open?
      Door.open
      Slacknotifier.new.speak("#{current_user} has entered the office.")
    end

    render nothing: true
  end

  private

  def date_for(string)
    DateTime.strptime(string,"%Y-%m-%d")
  end
end
