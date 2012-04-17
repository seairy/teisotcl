# -*- encoding : utf-8 -*-
class Country < ActiveRecord::Base
  belongs_to :continent
end
