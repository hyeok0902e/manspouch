class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, only: [:new, :edit, :delete, :upvote, :custom]
  impressionist actions: [:show]

  # 전역변수 초기화
  @@filter = ""

  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    @tags = @content.tags
  end

  # GET /contents/new
  def new
    @content = current_user.contents.build
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = current_user.contents.build(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # 맞춤 콘텐츠
  def custom
    @@category = params[:category]
    if @@category == "all"
      @contents = Content.all
    else
      @contents = Content.where(:category => @@category)
    end

    if @@filter != ""
      if @@filter == "latest"
        @contents_normal = @contents.order("created_at DESC")
      elsif @@filter == "hottest"
        hottest(@contents)
      end
    else
      @contents_normal = @contents.order("created_at DESC")
    end
  end

  def filter
    @@filter = params[:filter]
    redirect_to "/contents/custom/#{@@category}"
  end

  # acts_as_votable
  # 투표 관련 Controller 내용 : 찬성
  def upvote
    @content = Content.find(params[:id])

    @content.upvote_by current_user
    redirect_to(request.referer)
    # redirect_to(request.referrer, :notice => '해당 글을 추천하셨습니다.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:thumb, :title, :subtitle, :body, :link, :category, :keyword,
                                      :normal, :dry, :oily, :complex, :sensitive,
                                      :notcare, :basecare, :hardcare, :makeup, :idol)
    end

    # filter
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

      @contents_normal = []
      for i in 0..(@contentsArray.length-1)
        @contents_normal << Content.find(@contentsArray[i][1])
      end
    end
end
