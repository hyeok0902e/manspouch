class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :delete, :custom]

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

    respond_to do |format|
      if @product.save
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

    if @@filter != ""
      if @@filter == "latest"
        @products_normal = @products.order("created_at DESC")
      elsif @@filter == "hottest"
        hottest(@products)
      elsif @@filter == "price"
        price(@products)
      end
    else
      @products_normal = @products.order('created_at DESC')
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
end
