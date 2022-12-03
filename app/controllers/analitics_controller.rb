class AnaliticsController < ApplicationController
  def show
    url_id = Url.find_by(short_code: params[:shortcode])
    @visitors = Analitic.where(url_id: url_id).all
    @total_click_count = Analitic.where(url_id: url_id).count('click_count')
    @total_unique_visitors = Analitic.where(url_id: url_id).count
  end
end
