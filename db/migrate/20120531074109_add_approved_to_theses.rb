class AddApprovedToTheses < ActiveRecord::Migration
  def change
    add_column :theses, :summary_approved, :boolean, :null => false, :default => false, :after => :document_updated_at
    add_column :theses, :thesis_approved, :boolean, :null => false, :default => false, :after => :summary_approved
  end
end
