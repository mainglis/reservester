class Restaurant < ActiveRecord::Base
	validates :name, presence: true

	mount_uploader :photo, PhotoUploader

	belongs_to :owner
	# that table needs an owner_id column
	has_many :reservations

	accepts_nested_attributes_for :reservations
end
