class Rating < ActiveRecord::Base
  belongs_to :review
  belongs_to :thesis
  belongs_to :expert
end
