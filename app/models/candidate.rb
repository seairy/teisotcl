class Candidate < ActiveRecord::Base
  
  scope :approved, where('approved = 1')
  scope :ordered, order('top DESC').order('approved DESC').order('id ASC')
end
