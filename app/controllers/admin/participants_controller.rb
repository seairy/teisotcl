# -*- encoding : utf-8 -*-
class Admin::ParticipantsController < Admin::BaseController
  
  def index
    @participants = Participant.order('created_at DESC').paginate :page => params[:page]
  end
  
  def approved
    @participants = Participant.approved.order('created_at DESC').paginate :page => params[:page]
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
  
  def simulate_signin
    @participant = Participant.find(params[:id])
    session[:participant_id] = @participant.id
    session[:participant_chinese_name] = @participant.chinese_name
    session[:participant_last_signined_at] = @participant.last_signined_at
    session[:participant_attend_as] = @participant.attend_as
    redirect_to dashboard_participants_url
  end
  
  def register
    @participant = Participant.find(params[:id])
    @participant.update_attribute(:registered_at, Time.now) if @participant.registered_at.blank?
    redirect_to admin_participant_path(@participant, :anchor => 'registration')
  end
  
  def pay_fee
    @participant = Participant.find(params[:id])
    @participant.update_attribute(:fee_paid, params[:payment])
    redirect_to admin_participant_path(@participant, :anchor => 'registration')
  end
  
  def pay_isclt_fee
    @participant = Participant.find(params[:id])
    @participant.update_attribute(:isclt_fee_paid, params[:payment])
    redirect_to admin_participant_path(@participant, :anchor => 'registration')
  end
  
  def attend_banquet
    @participant = Participant.find(params[:id])
    if params[:attend] == 'no'
      @participant.update_attribute(:attend_banquet, false)
    else
      @participant.update_attribute(:attend_banquet, true)
    end
    redirect_to admin_participant_path(@participant, :anchor => 'registration')
  end
  
  def attend_congress
    @participant = Participant.find(params[:id])
    if params[:attend] == 'no'
      @participant.update_attribute(:attend_congress, false)
    else
      @participant.update_attribute(:attend_congress, true)
    end
    redirect_to admin_participant_path(@participant, :anchor => 'registration')
  end
  
  def tour_museum
    @participant = Participant.find(params[:id])
    if params[:attend] == 'no'
      @participant.update_attribute(:tour_museum, false)
    else
      @participant.update_attribute(:tour_museum, true)
    end
    redirect_to admin_participant_path(@participant, :anchor => 'registration')
  end
  
  def tour_tw
    @participant = Participant.find(params[:id])
    if params[:attend] == 'no'
      @participant.update_attribute(:tour_tw, false)
    else
      @participant.update_attribute(:tour_tw, true)
    end
    redirect_to admin_participant_path(@participant, :anchor => 'registration')
  end
end
