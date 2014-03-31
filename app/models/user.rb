class User < ActiveRecord::Base
  validates :name, :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :restaurants, through: :reservations

  has_many :stars
  has_many :starred_restaurants, through: :stars, source: :restaurant

  def owner?
  	if current_user.role == 'owner'
  		return true
  	else
  		return false 
  	end
	end

  def patron?
    if current_user.role == 'patron'
      return true
    else
      return false
    end
  end

end

# This is the right way to do it
# def owner?
#   isOwner = false
#   if self.role == "owner"
#     isOwner = true
#   end
# end

# def self.patron?
#   isPatron = false
#   if self.role == "patron"
#     isPatron = true
#   end
# end
