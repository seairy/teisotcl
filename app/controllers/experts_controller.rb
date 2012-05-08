# -*- encoding : utf-8 -*-
class ExpertsController < ApplicationController
  before_filter :authenticate_expert

  def dashboard
    @unrated_rating_count = Expert.find(session[:expert_id]).ratings.unrated.count
  end

  def update
    @expert = Expert.find(params[:id])
    if @expert.update_attributes(params[:expert])
      params[:edit_thesis] ? render('update_thesis_successful') : render('update_successful')
    else
      params[:edit_thesis] ? render(action: 'edit_thesis') : render(action: 'edit')
    end
  end
  
  def update_password
    @expert = Expert.find(session[:expert_id])
    if !@expert.authenticate(params[:original_password])
      flash[:alert] = '原密码输入不正确'
    elsif params[:new_password] != params[:confirmed_password]
      flash[:alert] = '两次新密码输入不一致'
    elsif params[:new_password].blank?
      flash[:alert] = '新密码不能为空'
    elsif params[:new_password] !~ /^[a-zA-Z0-9_]{6,16}$/
      flash[:alert] = '新密码只能使用英文、数字及下划线，并保持长度为6至16位'
    else
      @expert.update_attributes :password => params[:new_password], :password_confirmation => params[:new_password]
      flash[:notice] = '密码修改成功'
    end
    redirect_to edit_password_experts_url
  end
  
  protected
  def authenticate_expert_id
    unless params[:id].blank?
      params[:id] = session[:expert_id] if params[:id] != session[:expert_id]
    end
  end
  
  def authenticate_expert
    if session[:expert_id].blank?
      redirect_to expert_signin_url
    end
  end
end
