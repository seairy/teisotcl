# -*- encoding : utf-8 -*-
class Participant < ActiveRecord::Base
  AttendAsThesisAuthor = 1
  has_secure_password
  belongs_to :nationality, :class_name => 'Country'
  belongs_to :teaches_in, :class_name => 'Country'
  has_one :thesis
  accepts_nested_attributes_for :thesis
  validates :account, :format => { :with => /\A[a-zA-Z0-9_]+\z/, :message => "只能使用英文、数字及下划线" }, :length => { :in => 5..16 }, :uniqueness => true, :presence => true
  validates :password, :password_confirmation, :format => { :with => /\A[a-zA-Z0-9_]+\z/, :message => "只能使用英文、数字及下划线" }, :length => { :in => 6..16 }, :presence => true, :on => :create
  validates :chinese_name, :length => { :maximum => 100 }, :presence => true
  validates :gender, :presence => true
  validates :nationality_id, :presence => true
  validates :phone, :length => { :maximum => 100 }, :presence => true
  validates :mobile, :length => { :maximum => 100 }, :presence => true
  validates :email, :format => { :with => /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/, :message => "只能使用有效地址" }, :length => { :maximum => 200 }, :presence => true
  validates :company, :length => { :maximum => 100 }, :presence => true
end
