# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  RoleAdmin, RoleLeader, RoleEditor, RoleVolunteer = 1, 2, 3, 4
  has_secure_password
  validates :account, :format => { :with => /\A[a-zA-Z0-9_]+\z/, :message => "只能使用英文、数字及下划线" }, :length => { :in => 5..16 }, :uniqueness => true, :presence => true
  validates :password, :password_confirmation, :format => { :with => /\A[a-zA-Z0-9_]+\z/, :message => "只能使用英文、数字及下划线" }, :length => { :in => 6..16 }, :presence => true, :on => :create
  validates :name, :length => { :maximum => 100 }, :presence => true
end
