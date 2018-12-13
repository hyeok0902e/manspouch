class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile, ImageUploader # carrierwave

  has_many :comments
  has_many :reviews
  has_many :contents
  has_many :products
end
