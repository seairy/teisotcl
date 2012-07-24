# -*- encoding : utf-8 -*-
class Admin::ExcelsController < Admin::BaseController
  respond_to :html, :xls
  
  def export_thesis_author_participants
    @participants = Participant.thesis_author
    respond_with @participants
  end
  
  def export_nonvoting_participants
    @participants = Participant.nonvoting
    respond_with @participants
  end
  
  def export_approved_participants
    @participants = Participant.approved
    respond_with @participants
  end
  
  def export_submited_participants
    @participants = Participant.submited
    respond_with @participants
  end
  
  def export_experts
    @experts = Expert.all
    respond_with @experts
  end
  
  def export_reviews
    
  end
  
  def export_bookings
    @hotels = Hotel.all
    respond_with @hotels
  end
end
