class SellRecordsController < ApplicationController
  skip_before_action :authorized
  def index
    render json: SellRecord.all
  end

  def show
    render json: SellRecord.find_by(id: params[:id])
  end
  
end
