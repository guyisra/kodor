class UsersController < ApplicationController
  http_basic_authenticate_with name: ENV['KODOR_USER'], password: ENV['KODOR_PASSWORD'], only: [:index, :create, :delete]

  def index
  end

  def create
    start_date = date_for(params[:start_date])
    end_date = date_for(params[:end_date]).end_of_day
    if end_date < DateTime.now || end_date < start_date
      flash.now[:error] = 'An error has occurred. Shame on YOU!'
      return
    end

    uid = SecureRandom.uuid
    user = User.create(uid: uid,
                       name: params[:name],
                       provider: 'Klarna',
                       start_date: start_date,
                       end_date: end_date)

    flash.now[:info] = "Created a link for #{user.name}: #{url_for(uid)}"
    render :index
  end

  def delete
    User.delete(params[:id])

    render :index
  end

  private

  def date_for(string)
    DateTime.strptime(string, '%Y-%m-%d')
  end

  def url_for(uid)
    url = pages_url(uid)

    Rails.env == 'production' ? Bitly.client.shorten(url).short_url : url
  end
end
