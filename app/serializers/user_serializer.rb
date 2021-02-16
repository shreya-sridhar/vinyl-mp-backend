class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :sell_records, :orders

  def sell_records
    ActiveModel::SerializableResource.new(object.sell_records,  each_serializer:SellRecordSerializer)
  end

  def orders
    ActiveModel::SerializableResource.new(object.orders,  each_serializer:OrderSerializer)
  end

end
