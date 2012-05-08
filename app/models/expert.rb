# -*- encoding : utf-8 -*-
class Expert < ActiveRecord::Base
  has_secure_password
  validates :password, :password_confirmation, :format => { :with => /\A[a-zA-Z0-9_]+\z/, :message => "只能使用英文、数字及下划线" }, :length => { :in => 6..16 }, :presence => true, :on => :create
  validates :name, :length => { :maximum => 100 }, :presence => true
  has_many :ratings do
    def for_review review
      where(:review_id => review.id)
    end
    
    def unrated
      where(:rated_at => nil)
    end
    
    def approved
      where('rated_at IS NOT NULL').where(['grade = ? OR points >= 60', Rating::GradeApproved])
    end
    
    def failure
      where('rated_at IS NOT NULL').where(['grade = ? OR points < 50', Rating::GradeFailure])
    end
    
    def reserved
      where('rated_at IS NOT NULL').where(['grade = ? OR (points >= 50 AND points < 60)', Rating::GradeReserved])
    end
  end
  class << self
    def available_for thesis
      where('id NOT IN (?)', Rating.where(:thesis_id => thesis.id).all.map{ |r| r.expert_id } << 0)
    end
    
    def batched_create account_and_passwords
      account_and_passwords.each do |aap|
        aap_array = aap.split(',').map{|aop| aop.strip unless aop.strip.blank?}.compact
        create({ :account => aap_array[0], :password => aap_array[1], :password_confirmation => aap_array[1], :name => aap_array[0]}) if aap_array.size == 2
      end
    end
  end
end
