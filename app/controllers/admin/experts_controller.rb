# -*- encoding : utf-8 -*-
class Admin::ExpertsController < Admin::BaseController
  
  def index
    @experts = Expert.paginate :page => params[:page]
  end

  def show
    @reviews = Review.all
    @expert = Expert.find(params[:id])
  end

  def new
    @expert = Expert.new
  end

  def edit
    @expert = Expert.find(params[:id])
  end

  def create
    @expert = Expert.new(params[:expert])
    if @expert.save
      redirect_to [:admin, @expert], notice: '创建成功'
    else
      render action: 'new'
    end
  end
  
  def batched_create
    account_and_passwords = params[:account_and_passwords].split(/[\r\n]/).map{|aap| aap.strip unless aap.strip.blank?}.compact
    Expert.batched_create account_and_passwords
    redirect_to admin_experts_url, :notice => '批量添加成功'
  end

  def update
    @expert = Expert.find(params[:id])
    if @expert.update_attributes(params[:expert])
      redirect_to [:admin, @expert], notice: '更新成功'
    else
      render action: 'edit'
    end
  end
  
  def reset_password
    new_password = rand.to_s[-6, 6]
    @expert = Expert.find(params[:id])
    @expert.update_attributes :password => new_password, :password_confirmation => new_password
    redirect_to [:admin, @expert], notice: "密码重置成功，新密码为#{new_password}"
  end
  
  def simulate_signin
    @expert = Expert.find(params[:id])
    session[:expert_id] = @expert.id
    session[:expert_name] = @expert.name
    session[:expert_last_signined_at] = @expert.last_signined_at
    redirect_to dashboard_experts_url
  end
end
