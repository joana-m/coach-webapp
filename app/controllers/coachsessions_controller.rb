class CoachsessionsController < ApplicationController

  def index
    if params[:activities]
      @coachsessions = CoachSession.where(type_of_activity: params[:activities])
    else
      @coachsessions = CoachSession.all
    end

    @markers = @coachsessions.geocoded.map do |coachsession|
      {
        lat: coachsession.latitude,
        lng: coachsession.longitude
      }
    end
  end

  def show
    @coachsession = set_coachsession
    @booking = Booking.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_coachsession
    CoachSession.find(params[:id])
  end

  def coachsession_params
    params.require(:coachsession).permit(:session_name, :type_of_activity, :description, :price_per_day, :main_photo, :additional_photos)
  end

end
