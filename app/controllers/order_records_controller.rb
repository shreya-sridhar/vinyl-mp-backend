class OrderRecordsController < ApplicationController
  skip_before_action :authorized
  
  def index
    render json: OrderRecord.all
  end

  def create
    @order_record = OrderRecord.create(order_record_params)
    render json: @order_record
  end

  def show 
    @order_record = OrderRecord.find_by(id: params[:id])
    render json: @order_record
  end

  def destroy
    @order_record = OrderRecord.find_by(id: params[:id])
    @order_record.destroy
    render json: @order_record
  end 

  private
  def order_record_params
    params.require(:order_record).permit(:order_id,:record_id)
  end

end

