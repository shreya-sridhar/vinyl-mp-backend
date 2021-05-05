class SellRecordSerializer < ActiveModel::Serializer
  attributes :id, :sell_price, :record, :user

  def record
    ActiveModel::SerializableResource.new(object.record,  each_serializer: [RecordSerializer,UserSerializer])
  end
end
