class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio
  # has_many :order_records
  has_many :sell_records
  has_many :orders
end
