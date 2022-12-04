class AnaliticsController < ApplicationController
  def show
    # url_id = Url.find_by(short_code: params[:shortcode])
    @visitors = Analitic.where(url_id: params[:id]).all
    @total_click_count = Analitic.where(url_id: params[:id]).count('click_count')
    @total_unique_visitors = Analitic.where(url_id: params[:id]).count
  end
  
  #display all the visitors
  def index
    @visitors = Analitic.all
  end
end
