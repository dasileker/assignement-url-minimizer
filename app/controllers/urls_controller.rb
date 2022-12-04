class UrlsController < ApplicationController
  def show
    @url = Url.find(params[:id])
  end

  def redirect_to_url
    @ip = request.remote_ip
    @url = Url.find_by(short_code: params[:shortcode])

    render 'errors/404', status: :not_found if @url.nil?

    return if @url.nil?

    create_or_update_analytics(@ip, @url.id)
    redirect_to(@url.long_url, allow_other_host: true)
  end

  
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to @url, notice: 'url was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end



  private

  def create_or_update_analytics(ip, url_id)
    analytic = Analitic.find_by(url_id: url_id)
    if analytic.nil?
      Analitic.create(ip: ip, click_count: 1, last_visit: Time.zone.now, url_id: url_id)
    else
      count = analytic.click_count.to_i + 1
      analytic.update(click_count: count, last_visit: Time.zone.now)
    end
  end

  # Only allow a list of trusted parameters through.
  def url_params
    params.require(:url).permit(:long_url)
  end
end
