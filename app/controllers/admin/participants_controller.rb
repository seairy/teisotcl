# -*- encoding : utf-8 -*-
class Admin::ParticipantsController < Admin::BaseController
  
  def index
    @participants = Participant.order('created_at DESC').paginate :page => params[:page]
  end

  def show
    @reviews = Review.all
    @participant = Participant.find(params[:id])
  end

  def new
    @participant = Participant.new
    @participant.build_thesis
  end

  def edit
    @participant = Participant.find(params[:id])
  end

  def create
    @participant = Participant.new(params[:participant])
    if @participant.save
      redirect_to [:admin, @participant], notice: '创建成功'
    else
      render action: 'new'
    end
  end

  def update
    @participant = Participant.find(params[:id])
    if @participant.update_attributes(params[:participant])
      redirect_to [:admin, @participant], notice: '更新成功'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @participant = Participant.find(params[:id])
    Operation.create({ :user_id => session[:user_id], :participant_id => @participant.id, :chinese_name => @participant.chinese_name, :subject => @participant.thesis.subject })
    @participant.destroy
    redirect_to admin_participants_url, notice: '删除成功'
  end
  
  def reset_password
    new_password = rand.to_s[-6, 6]
    @participant = Participant.find(params[:id])
    @participant.update_attributes :password => new_password, :password_confirmation => new_password
    redirect_to [:admin, @participant], notice: "密码重置成功，新密码为#{new_password}"
  end
  
  def search
    @keyword = params[:keyword].strip
    if @keyword.blank?
      redirect_to admin_participants_path
    else
      @participants = Participant.search(params[:keyword]).paginate :page => params[:page]
      render 'result'
    end
  end
end
