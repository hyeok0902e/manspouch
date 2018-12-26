class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :delete, :custom]
  # load_and_authorize_resource

  # 전역변수 초기화
  @@filter = ""

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @tags = @product.tags
    @contents = @product.contents
  end

  # GET /products/new
  def new
    @product = current_user.products.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.build(product_params)
    alpha = ['a', 'b', 'c', 'd', 'e']

    respond_to do |format|
      if @product.save
        for i in 0..4
          if params["#{alpha[i]}"] != ""
            content = Content.find_by_id(params["#{alpha[i]}"].to_i)
            @product.contents << content
          end
        end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def custom
    @@category = params[:category]
    if @@category == "all"
      @products = Product.all
      # 맞춤 알고리즘
      personalize(@products)
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
      # 맞춤 알고리즘
      personalize(@products)
    end

    @products_filter = Product.all
    if @@filter != ""
      if @@filter == "latest"
        @products_normal = @products_filter.order("created_at DESC")
      elsif @@filter == "hottest"
        hottest(@products_filter)
      elsif @@filter == "price"
        price(@products_filter)
      end
    else
      @products_normal = @products_filter.order('created_at DESC')
    end
  end

  def filter
    @@filter = params[:filter]
    redirect_to "/products/custom/#{@@category}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:thumb, :name, :brand, :price, :body, :link, :category, :keyword,
                                      :normal, :dry, :oily, :complex, :sensitive,
                                      :notcare, :basecare, :hardcare, :makeup, :idol,
                                      :score)
    end

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

      @products_normal = []
      for i in 0..(@productsArray.length-1)
        @products_normal << Product.find(@productsArray[i][1])
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

      @products_normal = []
      for i in 0..(@productsArray.length-1)
        @products_normal << Product.find(@productsArray[i][1])
      end
    end

    def personalize(products)
      @productsArray = Array.new(products.count){Array.new(2)}
      index = 0
      skintype = ""

      @user = current_user
      if @user.skintype == "건성"
        skintype = "dry"
      elsif @user.skintype == "일반"
        skintype = "normal"
      elsif @user.skintype == "지성"
        skintype = "oily"
      elsif @user.skintype == "복합성"
        skintype = "complex"
      elsif @user.skintype == "민감성"
        skintype = "sensitive"
      end

      products.each do |product|
        @productsArray[index][1] = product.id
        @productsArray[index][0] = 0

        u_tags = @user.tags
        p_tags = product.tags

        p_tags.each do |p_tag|
          if u_tags.include?(p_tag)
            @productsArray[index][0] += 1
          end
        end

        index += 1
      end

      @productsArray = @productsArray.sort.reverse

      @products = []
      for i in 1..(@productsArray.count-1)
        product = Product.find_by_id(@productsArray[i][1])
        if product[skintype] == true
          @products << product
        end
      end

      if @products.count >= 12
        @products = @products[0..11]
      end
    end
end
