class Review < ApplicationRecord
  # validation
  validates :body, :presence => true

  belongs_to :user
  belongs_to :product

  after_create do
    @product = Product.find_by(id: self.product.id)
    @reviews = @product.reviews
    rate_sum = 0

    # score 총 합 구하기
    @reviews.each do |review|
      if review.score == nil
        review.score = 0
      elsif
        rate_sum += review.score
      end
    end

    # 평균 계산하기
    if rate_sum != 0
      @rate_avr = rate_sum.to_f / product.reviews.count
    else
      @rate_avr = 0
    end

    product.score = @rate_avr.to_f.round(1)
    product.save
  end
end
