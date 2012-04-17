# -*- encoding : utf-8 -*-
class Admin::SessionsController < Admin::BaseController
  skip_before_filter :authenticate
  
  def new
    render :layout => nil
  end
  
  def create
    user = User.where(:account => params[:account]).first.try(:authenticate, params[:password])
    unless user.blank?
      if user.available?
        user.update_attribute :last_signined_at, user.current_signined_at
        user.update_attribute :current_signined_at, Time.now
        session[:user_id] = user.id
        session[:user_name] = user.name
        session[:user_role] = user.role
        session[:user_last_signined_at] = user.last_signined_at
        redirect_to admin_root_url
      else
        redirect_to admin_signin_url, :alert => '该账号已被禁用'
      end
    else
      redirect_to admin_signin_url, :alert => '账号不存在或密码错误，请重试'
    end
  end

  def destroy
    reset_session
    redirect_to admin_signin_url
  end
end
