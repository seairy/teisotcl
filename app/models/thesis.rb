# -*- encoding : utf-8 -*-
class Thesis < ActiveRecord::Base
  has_attached_file :document, :path => ":rails_root/public/assets/theses/:hash.:extension", :url => "/assets/theses/:hash.:extension", :hash_secret => "CGmWFauN1P4tIe3kiDjFDusghm2LX"
  belongs_to :participant, :dependent => :destroy
  has_many :ratings do
    def for_review review
      where(:review_id => review.id)
    end
  end
  scope :rated, includes(:ratings).where('ratings.rated_at IS NOT NULL').order('theses.created_at DESC')
  scope :unrate, includes(:ratings).where('ratings.rated_at IS NULL').group('ratings.thesis_id').having('count(ratings.thesis_id) = 2').order('theses.created_at DESC')
  scope :search, lambda{ |keywords| where("subject LIKE '%#{keywords}%' OR first_author LIKE '%#{keywords}%' OR second_author LIKE '%#{keywords}%' OR keywords LIKE '%#{keywords}%' OR summary LIKE '%#{keywords}%'") }
  scope :submited, where('document_file_name IS NOT NULL')
  scope :approved, where('summary_approved = 1')
  validates :subject, :length => { :maximum => 250 }, :presence => true
  validates :first_author, :length => { :maximum => 50 }, :presence => true
  validates :keywords, :length => { :maximum => 100 }, :presence => true
  validates :summary, :length => { :minimum => 500 }, :presence => true
  
  class << self
    def archive
      archive_name = "archive_#{Time.now.strftime('%Y_%m_%d_%H_%M_%S')}_#{rand.to_s[-8..-1]}"
      FileUtils.mkdir_p "#{::Rails.root.to_s}/public/archives/#{archive_name}"
      Thesis.submited.each do |t|
        FileUtils.copy t.document_path, "#{::Rails.root.to_s}/public/archives/#{archive_name}/#{t.id}_#{t.participant.chinese_name}_#{t.subject}#{t.document.original_filename.scan(/\.\w+$/)[0]}"
      end
      system "cd #{::Rails.root.to_s}/public/archives; rar a #{archive_name}.rar #{archive_name}"
      FileUtils.rm_rf "#{::Rails.root.to_s}/public/archives/#{archive_name}"
      "#{archive_name}.rar"
    end
  end
  
  def submited?
    !document_file_name.blank?
  end
  
  def document_url
    if self.document.url =~ /^\/assets\/theses\/\w{40}\.\?\d+$/
      "#{self.document.url.scan(/^\/assets\/theses\/\w{40}\./)[0]}#{self.document.original_filename.scan(/\.(\w+)$/)[0][0]}"
    else
      self.document.url
    end
  end
  
  def document_path
    if self.document.path =~ /\S+\/assets\/theses\/\w{40}\.$/
      "#{self.document.path}#{self.document.original_filename.scan(/\.(\w+)$/)[0][0]}"
    else
      self.document.path
    end
  end
end
