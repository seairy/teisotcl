# -*- encoding : utf-8 -*-
class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :account, :limit => 32, :null => false
      t.string :password_digest, :limit => 100, :null => false
      t.integer :attend_as, :limit => 1, :null => false
      t.string :chinese_name, :foreign_name, :limit => 200
      t.integer :gender, :limit => 1
      t.references :nationality, :null => false
      t.string :address, :limit => 500
      t.string :postal_code, :limit => 20
      t.string :phone, :mobile, :fax, :email, :company, :title, :position, :limit => 200
      t.references :teaches_in
      t.string :teaches_at, :limit => 200
      t.text :remark
      t.datetime :last_signined_at, :current_signined_at
      t.boolean :approved
      t.timestamps
    end
  end
end
