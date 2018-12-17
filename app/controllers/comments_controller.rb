class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @content = Content.find(params[:content_id])
    @comment = @content.comments.create(params[:comment].permit(:body))
    @comment.user = current_user
    @comment.save

    redirect_to content_path(@content)
  end

  def destroy
    @content = Content.find(params[:content_id])
    @comment = @content.comments.find(params[:id])
    @comment.destroy

    redirect_to content_path(@content)
  end
end
