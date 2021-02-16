class Record < ApplicationRecord
  has_many :sell_records
  has_many :order_records

  def self.search(search)
    if search
      search_string = "%" + search.downcase + "%"
      Record.where("lower(name) LIKE ? OR lower(artist) LIKE ? OR  lower(songs_list) LIKE ?", search_string, search_string, search_string)
    else
      Record.all
    end
  end

  def self.popular_record
    Record.order('rating desc').limit(8)
  end

  def self.expensive_record
    Record.order('price desc').limit(8)
  end
end
