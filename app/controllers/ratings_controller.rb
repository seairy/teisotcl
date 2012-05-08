# -*- encoding : utf-8 -*-
class RatingsController < ApplicationController
  before_filter :find_expert
  
  def show
    @rating = @expert.ratings.find(params[:id])
  end
  
  def update
    @rating = @expert.ratings.find(params[:id])
    if @rating.update_attributes(params[:rating])
      @rating.update_attribute :rated_at, Time.now
      redirect_to [@expert, @rating], :notice => "评审信息提交成功，请点击左侧“未处理论文”继续进行评审"
    else
      render action: 'show'
    end
  end
  
  def unrated
    @ratings = @expert.ratings.unrated.paginate :page => params[:page], :per_page => 5
  end
  
  def approved
    @ratings = @expert.ratings.approved.paginate :page => params[:page], :per_page => 5
  end
  
  def failure
    @ratings = @expert.ratings.failure.paginate :page => params[:page], :per_page => 5
  end
  
  def reserved
    @ratings = @expert.ratings.reserved.paginate :page => params[:page], :per_page => 5
  end
  
  protected
  def find_expert
    @expert = Expert.find params[:expert_id]
  end
end
