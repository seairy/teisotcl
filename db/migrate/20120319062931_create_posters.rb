# -*- encoding : utf-8 -*-
class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :title, :limit => 200, :null => false
      t.has_attached_file :image
      t.string :url, :limit => 200, :null => false
      t.boolean :visible, :null => false
      t.integer :position
      t.timestamps
    end
  end
end
