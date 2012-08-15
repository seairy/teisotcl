# -*- encoding : utf-8 -*-
class Admin::DashboardController < Admin::BaseController
  
  def index
    @approved_participants_count = Participant.approved.count
    @registered_participants_count = Participant.registered.count
    @approved_thesis_author_participants_count = Participant.thesis_author.approved.count
    @approved_nonvoting_participants_count = Participant.nonvoting.approved.count
    @approved_trustee_participants_count = Participant.trustee.approved.count
    @registered_trustee_participants_count = Participant.trustee.registered.count
    @registered_thesis_author_participants_count = Participant.thesis_author.registered.count
    @registered_nonvoting_participants_count = Participant.nonvoting.registered.count
    @approved_isclt_member_participants_count = Participant.approved.isclt_member.count
    @registered_isclt_member_participants_count = Participant.approved.isclt_member.registered.count
    @tour_museum_participants_count = Participant.tour_museum.count
    @tour_tw_participants_count = Participant.tour_tw.count
    @attend_banquet_participants_count = Participant.attend_banquet.count
    @attend_congress_participants_count = Participant.attend_congress.count
    @hotels = Hotel.all
  end
end
