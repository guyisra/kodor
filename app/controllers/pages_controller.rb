class PagesController < ApplicationController
  def index
    if current_user
      Door.open
    end
  end

  def create
    uid = SecureRandom.uuid
    User.create(uid: uid, name: params[:name], provider: 'Klarna')

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
end