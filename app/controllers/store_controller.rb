class StoreController < ApplicationController
  # 전역변수 초기화
  @@filter = ""

  def index
  end

  def category
    # 카테고리 분류
    @@category = params[:category]
    if @@category == "all"
      @products = Product.all
    else
      if @@category == "skincare"
        @cate_ko = "스킨케어"
      elsif @@category == "faceup"
        @cate_ko = "페이스업"
      elsif @@category == "hair"
        @cate_ko = "헤어"
      else
        @cate_ko = "바디"
      end
      @products = Product.where(:category => @cate_ko)
    end

    # 카테고리 분류 + 필터(최신순, 인기순 .. 등)
    if @@filter != ""
      if @@filter == "latest"
        @products = @products.order("created_at DESC")
      elsif @@filter == "hottest"
        hottest(@products)
      elsif @@filter == "price"
        price(@products)
      end
    else
      @products = @products.order('created_at DESC')
    end
  end

  def filter
    @@filter = params[:filter]
    redirect_to "/store/category/#{@@category}"
  end


  private
    # filter
    def hottest(products)
      @productsArray = Array.new(products.count){Array.new(2)}
      index = 0

      products.each do |product|
        @productsArray[index][1] = product.id
        @productsArray[index][0] = product.reviews.count
        index += 1
      end
      @productsArray = @productsArray.sort.reverse

      @products = []
      for i in 0..(@productsArray.length-1)
        @products << Product.find(@productsArray[i][1])
      end
    end

    # filter
    def price(products)
      @productsArray = Array.new(products.count){Array.new(2)}
      index = 0

      products.each do |product|
        @productsArray[index][1] = product.id
        @productsArray[index][0] = product.price
        index += 1
      end
      @productsArray = @productsArray.sort

      @products = []
      for i in 0..(@productsArray.length-1)
        @products << Product.find(@productsArray[i][1])
      end
    end
end
