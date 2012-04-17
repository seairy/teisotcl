# -*- encoding : utf-8 -*-
class Admin::ReviewsController < Admin::BaseController
  
  def index
    @reviews = Review.paginate :page => params[:page]
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(params[:review])
    if @review.save
      redirect_to [:admin, @review], notice: '创建成功'
    else
      render action: 'new'
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review])
      redirect_to [:admin, @review], notice: '更新成功'
    else
      render action: 'edit'
    end
  end
end
