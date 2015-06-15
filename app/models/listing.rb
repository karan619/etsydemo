class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default.png"
		validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	else
		has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "https://photos-4.dropbox.com/t/2/AADDAnvMXswOpYF1e7-rSs2xF3WCCUtGSe5r36C4prZYaw/12/433717109/png/32x32/1/_/1/2/default.png/CPX-584BIAEgAiADIAQgBSAGIAcoBw/8ts9InaQWehan0HWGHDP1EtlhJidSGnSrVJ3-dkpwb4?size=1024x768&size_mode=2",
		:storage => :dropbox,
	  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	  :dropbox_options => {environment: ENV["RACK_ENV"]},
		:path => "images/:style/:id_:filename"#:style is medium/original/thumb..this path defines where image goes
		validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	end

	validates :name, :description, :price, presence: true
	validates :price, numericality: { greater_than: 0}
	validates_attachment_presence :image

	belongs_to :user
end
