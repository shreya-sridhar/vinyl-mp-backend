class CreateOrderRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :order_records do |t|
      t.belongs_to :order
      t.belongs_to :record

      t.timestamps
    end
  end
end
