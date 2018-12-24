class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, only: [:new, :edit, :delete, :upvote, :custom]
  impressionist actions: [:show]
  # load_and_authorize_resource

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
      # 맞춤 알고리즘
      personalize(@contents)
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
      @contents = Content.where(:category => @cate_ko)
      # 맞춤 알고리즘
      personalize(@contents)
    end

    @contents_filter = Content.all
    if @@filter != ""
      if @@filter == "latest"
        @contents_normal = @contents_filter.order("created_at DESC")
      elsif @@filter == "hottest"
        hottest(@contents_filter)
      end
    else
      @contents_normal = @contents_filter.order("created_at DESC")
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

    # personalize_contents
    def personalize(contents)
      @contentsArray = Array.new(contents.count){Array.new(2)}
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

      contents.each do |content|
        @contentsArray[index][1] = content.id
        @contentsArray[index][0] = 0

        u_tags = @user.tags
        c_tags = content.tags

        c_tags.each do |c_tag|
          if u_tags.include?(c_tag)
            @contentsArray[index][0] += 1
          end
        end

        index += 1
      end

      @contentsArray = @contentsArray.sort.reverse

      @contents = []
      for i in 1..(@contentsArray.count-1)
        content = Content.find_by_id(@contentsArray[i][1])
        if content[skintype] == true
          @contents << content
        end
      end

      if @contents.count >= 12
        @contents = @contents[0..11]
      end
    end
end
