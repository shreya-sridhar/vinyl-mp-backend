class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.string :name
      t.string :artist
      t.string :cover
      t.text :songs_list
      t.integer :year
      t.float :price

      t.timestamps
    end
  end
end
