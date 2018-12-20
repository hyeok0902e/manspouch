class Creature < ApplicationRecord
  # validation
  validates :title, :presence => true
  validates :subtitle, :presence => true
  validates :body, :presence => true
  validates :category, :presence => true

  belongs_to :user
  has_and_belongs_to_many :tags
  mount_uploader :thumb, ImageUploader
  has_many :talks
  acts_as_votable
  is_impressionable
  resourcify

  after_create do
    creature = Creature.find_by(id: self.id)
    hashtags = self.keyword.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      creature.tags << tag
    end
  end

  before_update do
    creature = Creature.find_by(id: self.id)
    creature.tags.clear
    hashtags = self.keyword.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      creature.tags << tag
    end
  end
end
