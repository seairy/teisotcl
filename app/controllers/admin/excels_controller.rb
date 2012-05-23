# -*- encoding : utf-8 -*-
class Admin::ExcelsController < Admin::BaseController
  respond_to :html, :xls
  
  def export_participants
    @participants = Participant.all
    respond_with @participants
  end
  
  def export_experts
    @experts = Expert.all
    respond_with @experts
  end
  
  def export_reviews
    
  end
end