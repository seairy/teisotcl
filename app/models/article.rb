# -*- encoding : utf-8 -*-
class Article < ActiveRecord::Base
  scope :available, where('visible = 1').order('featured DESC').order('displayed_at DESC')
end
