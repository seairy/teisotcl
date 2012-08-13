class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name, :limit => 200, :null => false
      t.boolean :approved, :top, :null => false
      t.timestamps
    end
  end
end
