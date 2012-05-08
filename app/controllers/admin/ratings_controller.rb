# -*- encoding : utf-8 -*-
class Admin::RatingsController < Admin::BaseController
  before_filter :find_participant, :except => %w{batched_new batched_create}
  
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
  
  def batched_create
    thesis_id_and_expert_names = params[:thesis_id_and_expert_names].split(/[\r\n]/).map{|tiaen| tiaen.strip unless tiaen.strip.blank?}.compact
    Rating.batched_create params[:ratings][:review_id], thesis_id_and_expert_names
    redirect_to batched_new_admin_ratings_path, :notice => '批量指派成功'
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
