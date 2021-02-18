class User < ApplicationRecord
  has_secure_password
  has_many :sell_records
  accepts_nested_attributes_for :sell_records
  has_many :orders
  # validates :username, uniqueness: { case_sensitive: false }
end
