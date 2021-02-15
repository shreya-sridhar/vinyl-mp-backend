class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :total_sum, :status
  has_many :order_records
end
