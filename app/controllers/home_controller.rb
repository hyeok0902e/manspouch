class HomeController < ApplicationController
  def index
  	@contents = Content.all
  	@contents = @contents[0..5]

    rank_of_products(Product.all)
  end

  def rank_of_products(products)
    @products = products.all.order("score desc")
  end
end
