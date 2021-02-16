class SellRecordSerializer < ActiveModel::Serializer
  attributes :id, :sell_price, :record

  def record
    ActiveModel::SerializableResource.new(object.record,  each_serializer: RecordSerializer)
  end
end
