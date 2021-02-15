class OrderRecordsController < ApplicationController
  def index
    render json: OrderRecord.all
  end
end
