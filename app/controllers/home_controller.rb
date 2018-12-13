class HomeController < ApplicationController
  def index
  	@content_all = Content.all
  	@contents = @content_all[0..5]
  end
end

