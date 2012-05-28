# -*- encoding : utf-8 -*-
class Review < ActiveRecord::Base
  has_many :ratings
end
