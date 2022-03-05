class ReviewsController < ApplicationController
  def create
    @coachsession = CoachSession.find(params[:coachsession_id])
    @review = Review.new(review_params)
    @review.coach_session = @coachsession
    if @review.save
      redirect_to coachsession_path(@coachsession, anchor: "review-#{@review.id}")
    else
      render 'coachsessions/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
