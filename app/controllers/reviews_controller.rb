class ReviewsController < ApplicationController
  def create
    @coachsession = Coachsession.find(params[:coachsession_id])
    @review = Review.new(review_params)
    @review.coach_session = @coachsession
    if @review.save
      redirect_to coachsession_path(@coachsession)
    else
      render 'coachsessions/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
