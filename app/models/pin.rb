class Pin < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true
	validates :user_id, presence: true
	# validates_attachment :image, presence: true,
	# 							 content_type: { content_type: ['image/jpeg', 'image/png', 'image/jpg', 'image/gif'] },
	# 							 size: { less_than: 5.megabytes }

	# validates_attachment  :image, :presence => true,
	# 					  :content_type => { :content_type => "image/jpg", "image/jpeg", "image/png", "image/git"  },
	# 					  :size => { :in => 0..10.kilobytes }
							     
	belongs_to :user						      
	has_attached_file :image, styles: { medium: "320x240>"}, :default_url => "/images/:style/missing.png"

	def image_remote_url=(url_value)
		self.image = URI.parse(url_value) unless url_value.blank?
		super
	end
end
