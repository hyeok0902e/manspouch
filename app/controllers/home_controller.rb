class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:check_email]
  def index
    # 인기 콘텐츠
  	@contents = Content.all
  	hottest(@contents)

    # 랭킹 콘텐츠
    rank_of_products(Product.all)
  end

  def rank_of_products(products)
    @products = products.all.order("score desc")
    @products = @products[0..4]
  end

  def hottest(contents)
    @contentsArray = Array.new(contents.count){Array.new(2)}
    index = 0

    contents.each do |content|
      @contentsArray[index][1] = content.id

      # 만약 좋아요가 없을 경우 0을 입력
      if content.get_upvotes.size == nil
        @contentsArray[index][0] = 0
      else
        @contentsArray[index][0] = content.get_upvotes.size
      end
      index += 1
    end
    @contentsArray = @contentsArray.sort.reverse

    @contents = []
    i = 0

    for i in 0..(@contentsArray.length-1)
      @contents << Content.find(@contentsArray[i][1])
      i += 1
      if i == 5
        break
      end
    end
  end

  # check email uniqueness in js whenever keypress
  def check_email
    email_found = User.where(email: params[:email]).count > 0 #Whatever your logic is to find duplicate emails
    message = email_found ? "ERROR" : "SUCCESS"
    render json: {message: message}
  end
end
