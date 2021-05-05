class OrderRecordSerializer < ActiveModel::Serializer
  attributes :id, :record, :order

  def record
    ActiveModel::SerializableResource.new(object.record,  each_serializer: RecordSerializer)
  end

end
