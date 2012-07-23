# -*- encoding : utf-8 -*-
class Admin::DashboardController < Admin::BaseController
  
  def index
    @approved_theses_count = Thesis.approved.count
    @submited_theses_count = Thesis.submited.approved.count
    @bookings_count = Booking.all.count
    @hotels = Hotel.all
  end
end
