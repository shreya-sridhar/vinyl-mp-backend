class SellRecordSerializer < ActiveModel::Serializer
  attributes :id, :sell_price, :user_id, :record_id
  belongs_to :user
  belongs_to :record
end
