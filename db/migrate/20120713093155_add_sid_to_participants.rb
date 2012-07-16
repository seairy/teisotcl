class AddSidToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :sid, :integer, :after => :id
  end
end
