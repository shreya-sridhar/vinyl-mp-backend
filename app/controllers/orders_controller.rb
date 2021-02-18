class OrdersController < ApplicationController
  skip_before_action :authorized
  def index
    render json: Order.all
  end

  def new 
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    @order.save
    render json: @order
  end

  def show 
    @order = Order.find_by(id: params[:id])
    render json: @order
  end

    
  def update
    @order = Order.find(params[:id])
    @order.update_attributes(params[:status])
  end

  private
  def order_params
    params.require(:order).permit(:user_id,:status,:total_sum)
  end

end

