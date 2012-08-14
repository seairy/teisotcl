class AddAwardToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :award, :integer, :after => :isclt_fee_paid
  end
end
