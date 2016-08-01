class UsersController < ApplicationController

  def index

  end

  def create
    start_date = date_for(params[:start_date])
    end_date = date_for(params[:end_date]).end_of_day
    return head :bad_request if end_date < DateTime.now || end_date < start_date

    uid = SecureRandom.uuid
    User.create({ uid: uid,
                  name: params[:name],
                  provider: 'Klarna',
                  start_date: start_date,
                  end_date: end_date })

    render json: { url: url_for(uid) }
  end

  def delete
    User.delete(params[:id])

    redirect_to :back
  end

  private

  def date_for(string)
    DateTime.strptime(string,"%Y-%m-%d")
  end

  def url_for(uid)
    url = pages_url(uid)

    Rails.env == 'production' ? Bitly.client.shorten(url).short_url : url
  end
end