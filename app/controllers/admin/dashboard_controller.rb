# -*- encoding : utf-8 -*-
class Admin::DashboardController < Admin::BaseController
  
  def index
    @total_participants_count = Participant.all.count
    @today_participants_count = Participant.today.count
    @rated_count = Rating.rated.count
    @unrate_count = Rating.unrate.count
    @signup_date_chart = Participant.signup_date_chart
  end
end
