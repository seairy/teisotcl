# -*- encoding : utf-8 -*-
class Admin::DashboardController < Admin::BaseController
  
  def index
    @total_participants_count = Participant.all.count
  end
end
