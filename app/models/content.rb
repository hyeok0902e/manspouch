class Content < ApplicationRecord
  # validate
  validates :title, :presence => true
  validates :subtitle, :presence => true
  validates :body, :presence => true
  validates :category, :presence => true

  has_and_belongs_to_many :tags
  mount_uploader :thumb, ImageUploader # carrierwave

  after_create do
    content = Content.find_by(id: self.id)
    hashtags = self.keyword.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      content.tags << tag
    end
  end

  before_update do
    content = Content.find_by(id: self.id)
    content.tags.clear
    hashtags = self.keyword.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      content.tags << tag
    end
  end
end
