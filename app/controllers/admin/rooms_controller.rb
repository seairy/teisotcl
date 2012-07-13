# -*- encoding : utf-8 -*-
class Admin::RoomsController < Admin::BaseController
  before_filter :find_hotel

  def new
    @room = Room.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(params[:room])
    @room.hotel = @hotel
    if @room.save
      redirect_to [:admin, @hotel], notice: '房型创建成功'
    else
      render action: 'new'
    end
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(params[:room])
      redirect_to [:admin, @hotel], notice: '房型更新成功'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to [:admin, @hotel], notice: '房型删除成功'
  end
  
  protected
  def find_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end
end
