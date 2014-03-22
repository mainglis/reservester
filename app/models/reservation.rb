class Reservation < ActiveRecord::Base
	validates :email, :reserve_on, :restaurant_id, presence: true
	belongs_to :restaurant 
end