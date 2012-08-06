# -*- encoding : utf-8 -*-
class BookingsController < ApplicationController
  before_filter :authenticate_participant
  before_filter :approve_participant
  before_filter :booked_check, :only => [:new]
  before_filter :expired
  
  def new
    @hotels = Hotel.all
    @booking = Booking.new
  end
  
  def edit
    @hotels = Hotel.all
    @booking = Booking.find(params[:id])
  end
  
  def create
    @participant = Participant.find(session[:participant_id])
    if @participant.bookings.blank?
      @booking = Booking.new(params[:booking])
      if @booking.room_id.blank?
        redirect_to new_booking_path, :alert => '请选择房型'
      else
        if @booking.room.full?
          redirect_to new_booking_path, :alert => '该房型已预定满，请重新选择'
        else
          @booking.participant = @participant
          @booking.tour_museum ||= false
          @booking.tour_tw ||= false
          if @booking.save
            redirect_to edit_booking_path(@booking), :notice => '酒店预定成功'
          else
            @hotels = Hotel.all
           render action: 'new'
          end
        end
      end
    else
      redirect_to edit_booking_path(@participant.bookings.first)
    end
  end
  
  def update
    @participant = Participant.find(session[:participant_id])
    @booking = Booking.find(params[:id])
    if @booking.participant.id != @participant.id
      redirect_to edit_booking_path(@participant.bookings.first)
    elsif Room.find(params[:booking][:room_id]).full?
      redirect_to edit_booking_path(@booking), :alert => '该房型已预定满，请重新选择'
    else
      if @booking.update_attributes(params[:booking])
        redirect_to edit_booking_path(@booking), :notice => '修改成功'
      else
        render action: 'new'
      end
    end
  end
  
  protected
  def booked_check
    @participant = Participant.find(session[:participant_id])
    redirect_to edit_booking_path(@participant.bookings.first) unless @participant.bookings.blank?
  end
  
  def expired
    render 'expired'
  end
end
