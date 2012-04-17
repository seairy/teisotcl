# -*- encoding : utf-8 -*-
class Expert < ActiveRecord::Base
  has_secure_password
  has_many :ratings do
    def unrated
      where(:rated_at => nil)
    end
    
    def approved
      where('rated_at IS NOT NULL').where('approved = 1 OR points >= 60')
    end
    
    def unapproved
      where('rated_at IS NOT NULL').where('approved = 0 OR points < 60')
    end
  end
  validates :account, :format => { :with => /\A[a-zA-Z0-9_]+\z/, :message => "只能使用英文、数字及下划线" }, :length => { :in => 5..16 }, :uniqueness => true, :presence => true
  validates :password, :password_confirmation, :format => { :with => /\A[a-zA-Z0-9_]+\z/, :message => "只能使用英文、数字及下划线" }, :length => { :in => 6..16 }, :presence => true, :on => :create
  validates :name, :length => { :maximum => 100 }, :presence => true
  
  class << self
    def available_for thesis
      where('id NOT IN (?)', Rating.where(:thesis_id => thesis.id).all.map{ |r| r.expert_id } << 0)
    end
  end
end
