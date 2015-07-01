class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :organisation
  validates :content,presence:true
  validates :user_id,presence:true
  validates :status,
            :presence => { :if => 'status.nil?' }
end
