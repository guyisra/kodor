class PagesController < ApplicationController
  def index
    if current_user.andand.can_open?
      Door.open
    end
  end

  def create
    start_date = date_for(params[:start_date])
    end_date = date_for(params[:end_date]).end_of_day
    return head :bad_request if start_date < DateTime.now || end_date < start_date

    uid = SecureRandom.uuid
    User.create({ uid: uid, name: params[:name], provider: 'Klarna' }.merge(params.slice(:name, :start_date, :end_date)))

    render json: { url: pages_url(uid) }
  end

  def open_again
    begin
      Door.open
      flash[:success] = "The door was opened again!"
    rescue
      flash[:warning] = "There was some problem openning the door..."
    end

    render nothing: true
  end

  private

  def date_for(string)
    DateTime.strptime(string,"%Y-%m-%d")
  end
end