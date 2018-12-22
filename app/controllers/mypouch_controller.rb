require "google/cloud/vision"
require "rmagick"

class MypouchController < ApplicationController
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token, only: [:result, :survey, :keyword] # Invalid AuthenticityToken Error

  def index
    @user = User.find_by(id: current_user.id)
    @contents_all = Content.all
    @products_all = Product.all
    @contents = []
    @products = []

    # 맞춤 콘텐츠
    @contents_all.each do |content|
      if (content.category=="스킨케어") || (content.category=="페이스업")
        @contents << content
      end
    end
    @contents = @contents[0..3]

    # 맞춤 제품
    @products_all.each do |product|
      if (product.category=="스킨케어") || (product.category=="페이스업")
        @products << product
      end
    end
    @products = @products[0..3]

    # 내가 쓴 Creature
    @creatures = Creature.where(:user_id => current_user.id)
  end

  def face
    @user = User.find_by(id: current_user.id)
  end

  def survey
    @user = User.find_by(id: current_user.id)
    @message = true
    if params.key?("user")
      @user.face.store!(params[:user][:face])
      @user.face = params[:user][:face]
      @user.save

      # import vision api
      vision = Google::Cloud::Vision.new(
        project: "savvy-badge-225906",
        keyfile: "./google/key.json"
      )

      # face detect
      image = vision.image @user.face.path
      faces = image.faces

      if faces.length == 0
        @message = false
      end

      # draw line - face detect
      image = Magick::Image.read(@user.face.path).first
      faces.each do |face|
        puts "Face bounds:"
        face.bounds.face.each do |vector|
          puts "(#{vector.x}, #{vector.y})"
        end

        draw = Magick::Draw.new
        draw.stroke = "green"
        draw.stroke_width 5
        draw.fill_opacity 0

        x1 = face.bounds.face[0].x.to_i
        y1 = face.bounds.face[0].y.to_i
        x2 = face.bounds.face[2].x.to_i
        y2 = face.bounds.face[2].y.to_i

        draw.rectangle x1, y1, x2, y2
        draw.draw image

      end

      # save face-detect img
      temp_file = Tempfile.new(['temp', '.png'])
      image.write(temp_file.path)
      @user.face = temp_file
      @user.save

      # close temp
      temp_file.close
      temp_file.unlink
    elsif !params.key?("user")
      redirect_to "/mypouch/face"
    end
  end

  def keyword
    @user = User.find_by(id: current_user.id)

    @user.skintype = params[:skintype]
    @user.save
  end

  def result
    temp1 = ['aa', 'ab', 'ac', 'ad', 'ae', 'af',
             'ag', 'ah', 'ai', 'aj', 'ak', 'al',
             'am', 'an', 'ao', 'ap', 'aq', 'ar']

    temp2 = ['ba', 'bb', 'bc', 'bd', 'be', 'bf',
             'bg', 'bh' ]

    @keyword = ""

    for i in 0..(temp1.length-1)
      if params["#{temp1[i]}"] != nil
        @keyword += (params["#{temp1[i]}"].to_s + " ")
      end
    end
    for i in 0..(temp2.length-1)
      if params["#{temp2[i]}"] != nil
        @keyword += (params["#{temp2[i]}"].to_s + " ")
      end
    end

    @user = User.find_by(id: current_user.id)
    if params["usertype"] != nil
      if params["usertype"] == "notcare"
        @user.usertype = "무관심형"
      elsif params["usertype"] == "basecare"
        @user.usertype = "기초케어형"
      elsif params["usertype"] == "hardcare"
        @user.usertype = "심화케어형"
      elsif params["usertype"] == "makeup"
        @user.usertype = "적극적화장형"
      elsif params["usertype"] == "idol"
        @user.usertype = "아이돌형"
      end
    end

    # keyword 안의 각 키워드를 Tag(user.tags) 모델에 저장하기
    @user.tags.clear
    hashtags = @keyword.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      @user.tags << tag # 태그 모델 저장
    end

    # user.keyword 저장
    @user.keyword = @keyword
    @user.save
  end
end
