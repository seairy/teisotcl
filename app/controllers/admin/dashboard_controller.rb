# -*- encoding : utf-8 -*-
class Admin::DashboardController < Admin::BaseController
  
  def index
    @total_participants_count = Participant.all.count
    @today_participants_count = Participant.today.count
  end
end
