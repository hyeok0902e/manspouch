class RankingController < ApplicationController
  def index
  end

  def category
    @category = params[:category]
    if @category == "all"
      @products = Product.all
      rank_of_products(@products)
    else
      if @category == "skincare"
        @cate_ko = "스킨케어"
      elsif @category == "faceup"
        @cate_ko = "페이스업"
      elsif @category == "hair"
        @cate_ko = "헤어"
      else
        @cate_ko = "바디"
      end
      @products = Product.where(:category => @cate_ko)
      rank_of_products(@products)
    end
  end

  def rank_of_products(products)
    @products = products.all.order("score desc")
  end
end
