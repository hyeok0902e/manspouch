class Tag < ApplicationRecord
  has_and_belongs_to_many :contents
  has_and_belongs_to_many :products 
end
