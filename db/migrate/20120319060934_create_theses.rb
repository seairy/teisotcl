# -*- encoding : utf-8 -*-
class CreateTheses < ActiveRecord::Migration
  def change
    create_table :theses do |t|
      t.references :participant, :null => false
      t.string :subject, :limit => 500
      t.string :first_author, :second_author, :limit => 100
      t.string :keywords, :limit => 200
      t.text :summary
      t.has_attached_file :document
      t.timestamps
    end
  end
end
