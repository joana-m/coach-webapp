class BookingsController < ApplicationController
  def index
    @user = current_user
    @bookings = @user.bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @coachsession = CoachSession.find(params[:id])
    # @booking.user = current_user
    @booking.total_amount = (@booking.date_end - @booking.date_start) * @coachsession.price_per_day
    # set the user
    # set the session id to the booking
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:user, :coach_session, :total_amount, :date_start, :date_end, :status)
  end
end
