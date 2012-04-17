# -*- encoding : utf-8 -*-
class Thesis < ActiveRecord::Base
  has_attached_file :document, :path => ":rails_root/public/assets/theses/:hash.:extension", :url => "/assets/theses/:hash.:extension", :hash_secret => "CGmWFauN1P4tIe3kiDjFDusghm2LX"
  belongs_to :participant
  has_many :ratings do
    def for_review review
      where(:review_id => review.id)
    end
  end
  validates :subject, :length => { :maximum => 250 }, :presence => true
  validates :first_author, :length => { :maximum => 50 }, :presence => true
  validates :keywords, :length => { :maximum => 100 }, :presence => true
  validates :summary, :length => { :minimum => 500 }, :presence => true
end
