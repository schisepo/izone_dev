class Organisation < ActiveRecord::Base
	has_many :users,dependent: :destroy
	has_many :tasks,dependent: :destroy
	validates :name,presence:true,length:{maximum:240}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,length:{maximum:240},
	format:{with: VALID_EMAIL_REGEX}
end
