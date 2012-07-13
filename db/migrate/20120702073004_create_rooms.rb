class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :hotel, :null => false
      t.string :name, :limit => 100, :null => false
      t.integer :quota, :price, :discount_price, :bed_amount, :null => false
      t.timestamps
    end
  end
end
