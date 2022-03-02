class CoachsessionsController < ApplicationController

  def index
    @coachsessions = CoachSession.where(type_of_activity: params[:activities])

    @markers = @coachsessions.geocoded.map do |coachsession|
      {
        lat: coachsession.latitude,
        lng: coachsession.longitude
      }
    end
  end

  def show
    @coachsession = set_coachsession
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
