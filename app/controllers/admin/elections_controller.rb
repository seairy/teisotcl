# -*- encoding : utf-8 -*-
class Admin::ElectionsController < Admin::BaseController
  
  def create
    @voters, @passion, @leading_by, @void = params[:voters], params[:passion], params[:leading_by], params[:void]
    available_voters = @voters.to_i - @void.to_i
    @results, top_votes, bottom_votes = [], 0, 0
    candidates_count = Candidate.all.count
    @max_votes = available_voters * 65
    @current_votes = 0
    Candidate.ordered.all.each_with_index do |candidate, index|
      votes = 0
      if candidate.top?
        while(votes <= 0 or votes >= available_voters) do
          votes = (60 * @passion.to_i / 100.0 + 40) / 100.0 * available_voters.to_i
          if rand(2) < 1
            votes += available_voters * rand(6) / 100.0
          else
            votes -= available_voters * rand(6) / 100.0
          end
          votes = votes.round
        end
        top_votes = votes
      else
        if top_votes == bottom_votes
          votes = top_votes - @leading_by.to_i
        else
          votes = (bottom_votes - rand(bottom_votes / (candidates_count - index + 1))).round
        end
      end
      bottom_votes = votes
      @current_votes += votes
      @results.push({ :name => candidate.name, :votes => votes })
    end
    render :show
  end
end