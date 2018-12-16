class StoreController < ApplicationController
  def index
  end

  def category
    @category = params[:category]
    if @category == "all"
      @products = Product.all
    else
      @products = Product.where(:category => @category)
    end
  end
end
