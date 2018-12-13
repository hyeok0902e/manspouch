class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(params[:review].permit(:body, :score))
    @review.user = current_user #이 comments의 user_id를 저장하여, 댓글을 단 사용자의 이메일을 노출할 수 있음!
    @review.save

    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy

    redirect_to product_path(@product)
  end
end
