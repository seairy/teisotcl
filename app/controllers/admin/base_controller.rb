# -*- encoding : utf-8 -*-
class Admin::BaseController < ApplicationController
  before_filter :authenticate
  
  def authenticate
    if session[:user_id].blank?
      redirect_to admin_signin_path
    end
  end
end
