class Tag < ApplicationRecord
  has_and_belongs_to_many :contents
  has_and_belongs_to_many :products
  has_and_belongs_to_many :users
  has_and_belongs_to_many :creatures
end
