# -*- encoding : utf-8 -*-
class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name, :limit => 200, :null => false
      t.boolean :marking, :null => false
      t.timestamps
    end
  end
end
