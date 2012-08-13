class Log < ActiveRecord::Base
  ActionRegister, ActionPayFee, ActionPayIscltFee = 1, 2, 3
  belongs_to :user
  belongs_to :participant
end
