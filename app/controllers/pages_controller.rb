class PagesController < ApplicationController
  def index
    if current_user.andand.can_open?
      @body_class = 'page'
    end
  end

  def open
    if current_user.andand.can_open?
      Door.open
      Slacknotifier.new.speak("#{current_user.name} has entered the office.") if current_user.provider == "Klarna"
    end

    render nothing: true
  end

  private

  def date_for(string)
    DateTime.strptime(string,"%Y-%m-%d")
  end
end
