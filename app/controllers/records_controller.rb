class RecordsController < ApplicationController
  skip_before_action :authorized
  
  def index
    if !params[:page].nil? && params[:page].to_i <= 0
      return redirect_to records_path
    end
      @records = Record.search(params[:search]).page(params[:page]).per_page(20)
      # @last_page = (Records.all-records(params[:all-records]).count.to_f / 15).ceil
    render json: @records
  end

  def popular
    @popular_records = Record.popular_record
    render json: @popular_records
  end

  def expensive
    @expensive_records = Record.expensive_record
    render json: @expensive_records
  end

  def show
    
  end

end
