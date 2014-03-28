class User < ActiveRecord::Base
  validates :name, :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :restaurants

  has_many :star_restaurants
  #has_many :stars, through: :star_restaurants

  has_many :starred_restaurants, through: :stars

  
  def owner?
  	if user.role == 'owner'
  		return true
  	else
  		return false 
  	end
	end

  def patron?
    if user.role == 'patron'
      return true
    else
      return false
    end
  end

end
