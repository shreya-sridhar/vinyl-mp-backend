class User < ApplicationRecord
  has_many :sell_records
  has_many :orders
  # has_secure_password
  # validates :username, uniqueness: { case_sensitive: false }
end
