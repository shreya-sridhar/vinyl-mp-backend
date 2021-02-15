class OrderRecordSerializer < ActiveModel::Serializer
  attributes :id, order_id, record_id
  # belongs_to :user
  # belongs_to :order
end
