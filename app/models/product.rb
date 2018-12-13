class Product < ApplicationRecord
  has_and_belongs_to_many :tags
  mount_uploader :thumb, ImageUploader # carrierwave

  after_create do
    product = Product.find_by(id: self.id)
    hashtags = self.keyword.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      product.tags << tag
    end
  end

  before_update do
    product = Product.find_by(id: self.id)
    product.tags.clear
    hashtags = self.keyword.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      product.tags << tag
    end
  end
end
