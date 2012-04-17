# -*- encoding : utf-8 -*-
class Article < ActiveRecord::Base
  scope :available, where('visible = 1').order('created_at DESC')
end
