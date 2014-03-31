class Star < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user
	# Why would you need the line below??
	# has_many :starred_restaurants, :through => :stars, :source => :user
end
	