# -*- encoding : utf-8 -*-
class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, :source, :limit => 200, :null => false
      t.text :content
      t.boolean :visible, :featured, :null => false
      t.integer :views_count, :default => 0, :null => false
      t.datetime :displayed_at, :null => false
      t.timestamps
    end
  end
end
