class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.string :status
      t.float :total_sum

      t.timestamps
    end
  end
end
