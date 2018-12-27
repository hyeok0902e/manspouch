class TinyimgsController < ApplicationController
  def new
    @tinyimg = Tinyimg.build.params(tinyimg_params)
  end

  def show
    @tinyimg = Tinyimg.find(params[:id])
  end

  private

  def tinyimg_params
    if parmas[]
    params.require(:tinyimg).permit(:file, :hint, :alt, :all_notice_id)
    end
  end



end
