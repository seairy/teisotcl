# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  
  def authenticate_participant_id
    unless params[:id].blank?
      params[:id] = session[:participant_id] if params[:id] != session[:participant_id]
    end
  end
  
  def approve_participant
    @participant = Participant.find(session[:participant_id])
    if @participant.attend_as == Participant::AttendAsThesisAuthor and !@participant.thesis.summary_approved?
      redirect_to dashboard_participants_url
    elsif @participant.attend_as == Participant::AttendAsNonvoting and !@participant.approved?
      redirect_to dashboard_participants_url
    end
  end
  
  def authenticate_participant
    if session[:participant_id].blank?
      redirect_to participant_signin_url
    end
  end
end
