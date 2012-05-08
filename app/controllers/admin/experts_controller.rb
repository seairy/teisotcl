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
end
