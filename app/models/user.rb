class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :destinations, dependent: :destroy
  has_many :restaurants, through: :destinations
  has_many :hotels, through: :destinations
  has_many :activities, through: :destinations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
