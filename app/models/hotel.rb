class Hotel < ActiveRecord::Base
  has_attached_file :image, :path => ":rails_root/public/assets/hotels/:hash.:extension", :url => "/assets/hotels/:hash.:extension", :hash_secret => "CGmWFauN1P4tIe3kiDjFDusghm2LX"
  has_many :rooms
end
