class AddOrderDateToOrderRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :order_records, :order_date, :date
  end
end
