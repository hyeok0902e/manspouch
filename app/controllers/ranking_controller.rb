class RankingController < ApplicationController
  def index
  end

  def category
    @category = params[:category]
    if @category == "all"
      @products = Product.all
      rank_of_products(@products)
    else
      @products = Product.where(:category => @category)
      rank_of_products(@products)
    end
  end

  def rank_of_products(products)
    @products = products.all.order("score desc")
  end
end
