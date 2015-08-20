class Organisation < ActiveRecord::Base
	has_many :users,dependent: :destroy
	has_many :tasks,dependent: :destroy
	has_one  :value_prop,dependent: :destroy
	validates :name,presence:true,length:{maximum:240}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,length:{maximum:240},
	format:{with: VALID_EMAIL_REGEX}

	 def self.search(search)
        where("name like ?", "%#{search}%") 
  	 end
end
