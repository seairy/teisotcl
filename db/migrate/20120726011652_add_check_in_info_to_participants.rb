class AddCheckInInfoToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :isclt_member, :boolean, :after => :teaches_at
    add_column :participants, :isclt_expired_at, :date, :after => :isclt_member
    add_column :participants, :registered_at, :datetime, :after => :approved
    add_column :participants, :fee_paid, :integer, :after => :approved
    add_column :participants, :attend_banquet, :boolean, :after => :registered_at
    add_column :participants, :attend_congress, :boolean, :after => :attend_banquet
    add_column :participants, :tour_museum, :boolean, :after => :attend_congress
    add_column :participants, :tour_tw, :boolean, :after => :tour_museum
    add_column :participants, :isclt_fee_paid, :integer, :after => :tour_tw
  end
end