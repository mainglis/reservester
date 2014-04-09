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
    self.role == 'owner'
	end

  def patron?
    self.role == 'patron'
  end

end
