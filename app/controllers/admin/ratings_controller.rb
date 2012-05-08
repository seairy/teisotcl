# -*- encoding : utf-8 -*-
class Admin::RatingsController < Admin::BaseController
  before_filter :find_participant
  
  def new
    @rating = Rating.new
  end
  
  def create
    @rating = Rating.new(params[:rating])
    @rating.thesis_id = @participant.thesis.id
    if @rating.save
      redirect_to [:admin, @participant], notice: '创建评审专家成功'
    else
      render action: 'new'
    end
  end
  
  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to [:admin, @participant], notice: '删除成功'
  end
  
  protected
  def find_participant
    @participant = Participant.find params[:participant_id]
  end
end
