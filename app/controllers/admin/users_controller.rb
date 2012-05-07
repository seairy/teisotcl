# -*- encoding : utf-8 -*-
class Admin::UsersController < Admin::BaseController
  
  def index
    @users = User.paginate :page => params[:page]
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to [:admin, @user], notice: '创建成功'
    else
      render action: 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to [:admin, @user], notice: '更新成功'
    else
      render action: 'edit'
    end
  end

  def update_password
    @user = User.find(session[:user_id])
    if !@user.authenticate(params[:original_password])
      flash[:alert] = '原密码输入不正确'
    elsif params[:new_password] != params[:confirmed_password]
      flash[:alert] = '两次新密码输入不一致'
    elsif params[:new_password].blank?
      flash[:alert] = '新密码不能为空'
    elsif params[:new_password] !~ /^[a-zA-Z0-9_]{6,16}$/
      flash[:alert] = '新密码只能使用英文、数字及下划线，并保持长度为6至16位'
    else
      @user.update_attributes :password => params[:new_password], :password_confirmation => params[:new_password]
      flash[:notice] = '密码修改成功'
    end
    redirect_to admin_edit_password_url
  end
  
  def reset_password
    new_password = rand.to_s[-6, 6]
    @user = User.find(params[:id])
    @user.update_attributes :password => new_password, :password_confirmation => new_password
    redirect_to [:admin, @user], notice: "密码重置成功，新密码为#{new_password}"
  end
end
