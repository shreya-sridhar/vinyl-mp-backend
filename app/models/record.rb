class Record < ApplicationRecord
  has_many :sell_records
  has_many :order_records
  # def self.search(search)
  #   if search
  #     Record.where("lower(name) LIKE ?", "%" + search.downcase + "%")
  #   else
  #     Record.all
  #   end
  # end
end
