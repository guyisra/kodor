class PagesController < ApplicationController
  def index
    if current_user.andand.can_open?
      Door.open
    end
  end

  def open_again
    Door.open
    render nothing: true
  end

  private

  def date_for(string)
    DateTime.strptime(string,"%Y-%m-%d")
  end
end