# -*- encoding : utf-8 -*-
class Rating < ActiveRecord::Base
  GradeApproved, GradeFailure, GradeReserved = 1, 2, 3
  belongs_to :review
  belongs_to :thesis
  belongs_to :expert
  validates :opinion, :presence => true, :if => :disagree?
  scope :rated, where('rated_at IS NOT NULL')
  scope :unrate, where('rated_at IS NULL')
  
  def disagree?
    grade == GradeFailure
  end
  
  def rated
    where('rated_at IS NOT NULL')
  end
  
  def unrate
    where('rated_at IS NULL')
  end
  
  def human_result
    if rated_at.blank?
      "未评审"
    else
      if review.marking?
        "#{points}分"
      else
        case grade
        when GradeApproved then "通过"
        when GradeFailure then "不通过"
        when GradeReserved then "保留"
        end
      end
    end
  end
  
  class << self
    def batched_create review_id, participant_id_and_expert_names
      participant_id_and_expert_names.each do |piaen|
        array = piaen.split(',').map{|pioen| pioen.strip unless pioen.strip.blank?}.compact
        participant_id = array.shift
        unless participant_id.blank? && array.size > 0
          participant = Participant.where(:id => participant_id).first
          unless participant.blank?
            array.each do |expert_name|
              expert = Expert.where(:name => expert_name).first
              unless expert.blank?
                create({ :review_id => review_id, :thesis_id => participant.thesis.id, :expert_id => expert.id })
              end
            end
          end
        end
      end
    end
  end
end
