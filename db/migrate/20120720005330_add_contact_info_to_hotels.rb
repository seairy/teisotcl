class AddContactInfoToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :phone, :string, :limit => 50, :after => :address
    add_column :hotels, :website, :string, :limit => 100, :after => :phone
  end
end
