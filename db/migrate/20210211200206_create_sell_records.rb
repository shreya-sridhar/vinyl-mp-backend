class CreateSellRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :sell_records do |t|
      t.belongs_to :record
      t.belongs_to :user
      t.float :sell_price

      t.timestamps
    end
  end
end
