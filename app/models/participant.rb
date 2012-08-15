# -*- encoding : utf-8 -*-
class Participant < ActiveRecord::Base
  AttendAsThesisAuthor, AttendAsNonvoting, AttendAsTrustee, AttendAsWorker = 1, 2, 3, 4
  AwardFirst, AwardSecond = 1, 2
  has_secure_password
  belongs_to :nationality, :class_name => 'Country'
  belongs_to :teaches_in, :class_name => 'Country'
  has_one :thesis, :dependent => :destroy
  has_many :bookings
  accepts_nested_attributes_for :thesis
  validates :account, :format => { :with => /\A[a-zA-Z0-9_]+\z/, :message => "只能使用英文、数字及下划线" }, :length => { :in => 5..16 }, :uniqueness => true, :presence => true
  validates :password, :password_confirmation, :format => { :with => /\A[a-zA-Z0-9_]+\z/, :message => "只能使用英文、数字及下划线" }, :length => { :in => 6..16 }, :presence => true, :on => :create
  validates :chinese_name, :length => { :maximum => 100 }, :presence => true
  validates :gender, :presence => true
  validates :nationality_id, :presence => true
  validates :email, :format => { :with => /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/, :message => "只能使用有效地址" }, :length => { :maximum => 200 }
  scope :thesis_author, where(['attend_as = ?', AttendAsThesisAuthor])
  scope :nonvoting, where(['attend_as = ?', AttendAsNonvoting])
  scope :trustee, where(['attend_as = ?', AttendAsTrustee])
  scope :isclt_member, where('isclt_member = 1')
  scope :tour_museum, where('tour_museum = 1')
  scope :tour_tw, where('tour_tw = 1')
  scope :attend_banquet, where('attend_banquet = 1')
  scope :attend_congress, where('attend_congress = 1')
  scope :today, where(['created_at >= ? AND created_at <= ?', Time.now.beginning_of_day, Time.now.end_of_day])
  scope :approved, where('approved = 1')
  scope :submited, includes(:thesis).where('theses.summary_approved = 1 AND theses.document_file_name IS NOT NULL')
  scope :registered, where('registered_at IS NOT NULL')
  scope :unregister, where('registered_at IS NULL')
  scope :search, lambda{ |keywords| where("account LIKE '%#{keywords}%' OR chinese_name LIKE '%#{keywords}%' OR foreign_name LIKE '%#{keywords}%' OR company LIKE '%#{keywords}%'") }
  
  class << self
    def signup_date_chart
      Date.new(2012, 4, 18).upto(Date.new(2012, 5, 28)).map do |d|
        "[\"#{d.strftime('%m/%d')}\", #{where(['created_at >= ? AND created_at <= ?', d.beginning_of_day, d.end_of_day]).count}]"
      end.join(', ')
    end
    
    def nationality_chart
      select('count(*) count, nationality_id').group('nationality_id').all.map do |pa|
        "[\"#{pa.nationality.name}（#{pa.count}人）\", #{pa.count}]"
      end.join(', ')
    end
  end
  
  def award?
    !award.blank?
  end
end
