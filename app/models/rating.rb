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
    Rating.where('rated_at IS NOT NULL')
  end
  
  def unrate
    Rating.where('rated_at IS NULL')
  end
  
  class << self
    def batched_create review_id, thesis_id_and_expert_names
      thesis_id_and_expert_names.each do |tiaen|
        array = tiaen.split(',').map{|tioen| tioen.strip unless tioen.strip.blank?}.compact
        thesis_id = array.shift
        unless thesis_id.blank? && array.size > 0
          thesis = Thesis.where(:id => thesis_id).first
          unless thesis.blank?
            array.each do |expert_name|
              expert = Expert.where(:name => expert_name).first
              unless expert.blank?
                create({ :review_id => review_id, :thesis_id => thesis.id, :expert_id => expert.id })
              end
            end
          end
        end
      end
    end
  end
end
