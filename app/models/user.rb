class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile, ImageUploader # carrierwave

  has_many :comments
  has_many :reviews
  has_many :talks
  has_many :contents
  has_many :products
  has_many :creatures
  has_and_belongs_to_many :tags
  acts_as_votable
end
