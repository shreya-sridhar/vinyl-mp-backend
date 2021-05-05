class SellRecord < ApplicationRecord
  belongs_to :user
  belongs_to :record
  accepts_nested_attributes_for :record
  accepts_nested_attributes_for :user
end
