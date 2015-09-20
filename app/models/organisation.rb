class Organisation < ActiveRecord::Base
	has_many :users,dependent: :destroy
	has_many :tasks,dependent: :destroy
	has_one  :value_prop,dependent: :destroy
	validates :name,presence:true,length:{maximum:240}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,length:{maximum:240},
	format:{with: VALID_EMAIL_REGEX}
	has_attached_file :logo, 
	:path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
	:url => "/system/:attachment/:id/:basename_:style.:extension",
	:styles => {
	  :thumb    => ['100x100#',  :jpg, :quality => 70],
	  :preview  => ['480x480#',  :jpg, :quality => 70],
	  :large    => ['600>',      :jpg, :quality => 70],
	  :retina   => ['1200>',     :jpg, :quality => 30]
	},
	:convert_options => {
	  :thumb    => '-set colorspace sRGB -strip',
	  :preview  => '-set colorspace sRGB -strip',
	  :large    => '-set colorspace sRGB -strip',
	  :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
	}
	validates_attachment :logo,
	    :presence => true,
	    :size => { :in => 0..10.megabytes },
	    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

	 def self.search(search)
        where("name like ?", "%#{search}%") 
  	 end
end
 