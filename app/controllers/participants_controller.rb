# -*- encoding : utf-8 -*-
class ParticipantsController < ApplicationController
  before_filter :authenticate_participant, :except => [:new, :create]
  before_filter :approve_participant, :except => [:new, :create, :dashboard]
  before_filter :authenticate_participant_id, :only => [:show_thesis, :edit, :edit_thesis, :update]
  before_filter :signup_expiration, :only => [:new, :create]

  def dashboard
    @participant = Participant.find(session[:participant_id])
  end
  
  def show_thesis
    @participant = Participant.find(params[:id])
  end

  def new
    @participant = Participant.new
    @participant.build_thesis
  end

  def edit
    @participant = Participant.find(params[:id])
  end
  
  def edit_thesis
    @participant = Participant.find(params[:id])
  end

  def create
    @participant = Participant.new(params[:participant])
    if @participant.save
      render 'create_successful'
    else
      render action: 'new'
    end
  end

  def update
    @participant = Participant.find(params[:id])
    if @participant.update_attributes(params[:participant])
      params[:edit_thesis] ? redirect_to(show_thesis_participant_path(@participant), :notice => '论文信息修改成功') : redirect_to(edit_participant_path(@participant), :notice => '个人信息更新成功')
    else
      params[:edit_thesis] ? render(action: 'edit_thesis') : render(action: 'edit')
    end
  end
  
  def update_password
    @participant = Participant.find(session[:participant_id])
    if !@participant.authenticate(params[:original_password])
      flash[:alert] = '原密码输入不正确'
    elsif params[:new_password] != params[:confirmed_password]
      flash[:alert] = '两次新密码输入不一致'
    elsif params[:new_password].blank?
      flash[:alert] = '新密码不能为空'
    elsif params[:new_password] !~ /^[a-zA-Z0-9_]{6,16}$/
      flash[:alert] = '新密码只能使用英文、数字及下划线，并保持长度为6至16位'
    else
      @participant.update_attributes :password => params[:new_password], :password_confirmation => params[:new_password]
      flash[:notice] = '密码修改成功'
    end
    redirect_to edit_password_participants_url
  end
  
  def invitation
    @participant = Participant.find(session[:participant_id])
    render :layout => nil
  end
  
  protected
  def signup_expiration
    render 'expired'
  end
end
