class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name, :limit => 200, :null => false
      t.string :address, :limit => 1000
      t.has_attached_file :image
      t.text :description
      t.timestamps
    end
  end
end
