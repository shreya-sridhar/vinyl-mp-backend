class OrderRecord < ApplicationRecord
  belongs_to :order
  belongs_to :record
end
