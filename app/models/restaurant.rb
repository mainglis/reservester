class Restaurant < ActiveRecord::Base
	validates :name, presence: true

	mount_uploader :photo, PhotoUploader

	belongs_to :user
	# when you see belongs_to, means that the table/model you are 
	# editing will have an id form related to the word that comes after the :
	# in this case, restaurant table will have user_id as a field

	has_many :reservations
	has_and_belongs_to_many :categories

	has_many :star_restaurants
	# has_many :starred_by, through: :star_restaurants, source: :user
	has_many :starred_by, through: :stars, source: :user

	def categories_by_name
		categories.map(&:name)
	end

	accepts_nested_attributes_for :reservations
end
