class Record < ApplicationRecord
  has_many :sell_records
  has_many :order_records

  def self.search_sort(search, sortby)
    records = []

    if search
      search_string = "%" + search.downcase + "%"
      records = Record.where("lower(name) LIKE ? OR lower(artist) LIKE ? OR  lower(songs_list) LIKE ? OR  lower(genre) LIKE ?",
                             search_string, search_string, search_string, search_string)
    elsif
      records = Record.all
    end

    case sortby
    when 'priceLtoH'
      records.order('price asc')
    when 'priceHtoL'
      records.order('price desc')
    when 'nameAtoZ'
      records.order('name asc')
    when 'nameZtoA'
      records.order('name desc')
    when 'newToOld'
      records.order('year desc')
    when 'oldToNew'
      records.order('year asc')
    when 'default'
      records
    else
      records
    end
  end

  def self.popular_record
    Record.order('rating desc').limit(8)
  end

  def self.expensive_record
    Record.order('price desc').limit(8)
  end
end