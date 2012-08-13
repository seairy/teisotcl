class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :user, :participant, :null => false
      t.integer :action
      t.timestamps
    end
  end
end
