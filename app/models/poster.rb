# -*- encoding : utf-8 -*-
class Poster < ActiveRecord::Base
  has_attached_file :image, :path => ":rails_root/public/assets/posters/:hash.:extension", :url => "/assets/posters/:hash.:extension", :hash_secret => "CGmWFauN1P4tIe3kiDjFDusghm2LX", :styles => {:poster => '563x375', :thumb => '106x71'}
end
