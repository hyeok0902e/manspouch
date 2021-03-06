class CreaturesController < ApplicationController
  before_action :set_creature, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :delete, :upvote]
  impressionist actions: [:show]

  # GET /creatures
  # GET /creatures.json
  def index
    @creatures = Creature.all
  end

  # GET /creatures/1
  # GET /creatures/1.json
  def show
    @tags = @creature.tags
  end

  # GET /creatures/new
  def new
    @creature = current_user.creatures.build
  end

  # GET /creatures/1/edit
  def edit
  end

  # POST /creatures
  # POST /creatures.json
  def create
    @creature = current_user.creatures.build(creature_params)

    respond_to do |format|
      if @creature.save
        format.html { redirect_to @creature, notice: 'Creature was successfully created.' }
        format.json { render :show, status: :created, location: @creature }
      else
        format.html { render :new }
        format.json { render json: @creature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creatures/1
  # PATCH/PUT /creatures/1.json
  def update
    respond_to do |format|
      if @creature.update(creature_params)
        format.html { redirect_to @creature, notice: 'Creature was successfully updated.' }
        format.json { render :show, status: :ok, location: @creature }
      else
        format.html { render :edit }
        format.json { render json: @creature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creatures/1
  # DELETE /creatures/1.json
  def destroy
    @creature.destroy
    respond_to do |format|
      format.html { redirect_to creatures_url, notice: 'Creature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def category
    @category = params[:category]
    if @category == "all"
      @creatures = Creature.all
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
      @creatures = Creature.where(:category => @cate_ko)
    end
  end

  def upvote
    @creature = Creature.find(params[:id])

    @creature.upvote_by current_user
    redirect_to(request.referer)
    # redirect_to(request.referrer, :notice => '해당 글을 추천하셨습니다.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creature
      @creature = Creature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creature_params
      params.require(:creature).permit(:thumb, :title, :subtitle, :body, :link, :category, :keyword,
                                      :normal, :dry, :oily, :complex, :sensitive,
                                      :notcare, :basecare, :hardcare, :makeup, :idol)
    end
end
