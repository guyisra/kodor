class PagesController < ApplicationController
  def index
  end

  def create
    uid = SecureRandom.uuid
    User.create(uid: uid, name: params[:name], provider: 'Klarna')

    render json: { url: pages_url(uid) }
  end
end