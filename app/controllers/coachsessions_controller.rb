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

  def create
    @coachsession = CoachSession.new(coachsession_params)
    @coachsession.user = current_user
    if @coachsession.save
      redirect_to coachsessions_path(@coachsession)
    else
      render :new
    end
  end

  def new
    @coachsession = CoachSession.new
  end

  def edit
  end

  def update
  end

  def destroy
    @coachsession = CoachSession.find(params[:id])
    @coachsession.destroy
    redirect_to coachsessions_path(@coachsession)
  end

  private

  def set_coachsession
    CoachSession.find(params[:id])
  end

  def coachsession_params
    params.require(:coach_session).permit(:session_name, :type_of_activity, :description, :price_per_day, :address, :main_photo, additional_photos: [])
  end

end
