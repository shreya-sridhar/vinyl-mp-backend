class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total_sum, :status, :order_records,:user
    def order_records
      ActiveModel::SerializableResource.new(object.order_records,  each_serializer: OrderRecordSerializer)
    end
end
