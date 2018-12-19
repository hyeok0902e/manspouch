class User < ApplicationRecord
  # validation
  # validates :face, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile, ImageUploader # carrierwave
  mount_uploader :face, ImageUploader # carrierwave

  has_many :comments
  has_many :reviews
  has_many :talks
  has_many :contents
  has_many :products
  has_many :creatures
  has_and_belongs_to_many :tags
  acts_as_votable

  before_destroy :destroy_assets
  def destroy_assets
    self.face.remove! if self.face
    self.profile.remove! if self.profile
    self.save!
  end
end
