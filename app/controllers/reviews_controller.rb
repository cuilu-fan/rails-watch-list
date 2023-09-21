class ReviewsController < ApplicationController
  before_action :set_params, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.list = @list
    @review.save
    redirect_to list_reviews_path(@list)
  end

  private

  def set_params
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
