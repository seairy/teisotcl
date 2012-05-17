class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.references :user, :null => false
      t.integer :participant_id, :null => false
      t.string :chinese_name, :limit => 200
      t.string :subject, :limit => 500
      t.timestamps
    end
  end
end
