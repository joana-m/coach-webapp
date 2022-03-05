class BookingsController < ApplicationController
  def index
    @user = current_user
    @bookings = @user.bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @coachsession = CoachSession.find(params[:coachsession_id])
    @booking.total_amount = (@booking.date_end - @booking.date_start) * @coachsession.price_per_day
    # set the user
    @booking.user = current_user
    # set the session id to the booking
    @booking.coach_session = @coachsession
    if @booking.save
      redirect_to bookings_path
    else
      render 'coachsessions/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end)
  end
end
