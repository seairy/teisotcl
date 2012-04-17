class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :review, :thesis, :expert, :null => false
      t.boolean :approved
      t.float :points
      t.text :opinion
      t.datetime :rated_at
      t.timestamps
    end
  end
end
