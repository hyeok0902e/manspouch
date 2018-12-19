require "google/cloud/vision"
require "rmagick"

class MypouchController < ApplicationController
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token, only: [:result, :survey] # Invalid AuthenticityToken Error

  def index
  end

  def face
  end

  def survey
    @user = User.find_by(id: current_user.id)
    if params.key?("user")
      @user.face.store!(params[:user][:face])
      @user.face = params[:user][:face]
      @user.save

      vision = Google::Cloud::Vision.new(
        project: "savvy-badge-225906",
        keyfile: "./google/key.json"
      )
    else
      redirect_to "/"
    end

  end

  def keyword
  end

  def result
    @keyword = ""
    count = params.length - 2
    alpha = ('a'..'z').to_a
    user = current_user

    # keyword 셋팅
    for i in 0..(alpha.length-1)
      if params["#{alpha[i]}"] != nil
        @keyword += (params["#{alpha[i]}"].to_s + " ")
      end
    end

    # keyword 안의 각 키워드를 Tag(user.tags) 모델에 저장하기
    user = User.find_by(id: current_user.id)
    user.tags.clear
    hashtags = @keyword.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      user.tags << tag # 태그 모델 저장
    end

    # user.keyword 저장
    user.keyword = @keyword
    user.save
  end
end
