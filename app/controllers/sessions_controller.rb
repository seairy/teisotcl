# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  
  def create_participant
    participant = Participant.where(:account => params[:account]).first
    if participant.blank?
      redirect_to participant_signin_url(:account => params[:account]), :flash => { :invalid_account => '账号不存在或输入不正确，请检查'}
    else
      if participant.authenticate(params[:password])
        participant.update_attribute :last_signined_at, participant.current_signined_at
        participant.update_attribute :current_signined_at, Time.now
        session[:participant_id] = participant.id
        session[:participant_chinese_name] = participant.chinese_name
        session[:participant_last_signined_at] = participant.last_signined_at
        session[:participant_attend_as] = participant.attend_as
        redirect_to dashboard_participants_url
      else
        redirect_to participant_signin_url(:account => params[:account]), :flash => { :invalid_password => '密码输入不正确，请检查' }
      end
    end
  end

  def destroy_participant
    session[:participant_id] = nil
    session[:participant_chinese_name] = nil
    session[:participant_last_signined_at] = nil
    redirect_to participant_signin_path
  end
  
  def create_expert
    expert = Expert.where(:account => params[:account]).first
    if expert.blank?
      redirect_to expert_signin_url(:account => params[:account]), :flash => { :invalid_account => '账号不存在或输入不正确，请检查'}
    else
      if expert.authenticate(params[:password])
        expert.update_attribute :last_signined_at, expert.current_signined_at
        expert.update_attribute :current_signined_at, Time.now
        session[:expert_id] = expert.id
        session[:expert_name] = expert.name
        session[:expert_last_signined_at] = expert.last_signined_at
        redirect_to dashboard_experts_url
      else
        redirect_to expert_signin_url(:account => params[:account]), :flash => { :invalid_password => '密码输入不正确，请检查' }
      end
    end
  end

  def destroy_expert
    session[:expert_id] = nil
    session[:expert_name] = nil
    session[:expert_last_signined_at] = nil
    redirect_to expert_signin_path
  end
end
