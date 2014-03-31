class User < ActiveRecord::Base
  validates :name, :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :restaurants

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
