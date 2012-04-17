# -*- encoding : utf-8 -*-
class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :account, :limit => 32, :null => false
      t.string :password_digest, :limit => 100, :null => false
      t.string :name, :limit => 200
      t.datetime :last_signined_at, :current_signined_at
      t.timestamps
    end
  end
end
