class User < ActiveRecord::Base
  extend Devise::Models
  has_many :reservations, dependent: :destroy
  has_many :bikes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
