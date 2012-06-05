# -*- encoding : utf-8 -*-
class Admin::DashboardController < Admin::BaseController
  
  def index
    @total_participants_count = Participant.all.count
    @submited_theses_count = Thesis.submited.count
    @rated_count = Rating.rated.count
    @unrate_count = Rating.unrate.count
    @signup_date_chart = Participant.signup_date_chart
    @nationality_chart = Participant.nationality_chart
  end
end
