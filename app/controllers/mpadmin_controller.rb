class MpadminController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def mpusers
  end

  def mpusershow
  end

  def contents
  end

  def products
  end
end
