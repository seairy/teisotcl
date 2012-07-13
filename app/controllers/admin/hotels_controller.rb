# -*- encoding : utf-8 -*-
class Admin::HotelsController < Admin::BaseController
  
  def index
    @hotels = Hotel.paginate :page => params[:page]
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
    @hotel = Hotel.new
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def create
    @hotel = Hotel.new(params[:hotel])
    if @hotel.save
      redirect_to [:admin, @hotel], notice: '创建成功'
    else
      render action: 'new'
    end
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update_attributes(params[:hotel])
      redirect_to [:admin, @hotel], notice: '更新成功'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to admin_hotels_url, notice: '删除成功'
  end
end
