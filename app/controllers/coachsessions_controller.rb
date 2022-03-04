class CoachsessionsController < ApplicationController

  def index
    if params[:search][:query]
      @coachsessions = CoachSession.search_by_type_of_activity(params[:search][:query])
    else
      @coachsessions = CoachSession.all
    end

    @markers = @coachsessions.geocoded.map do |coachsession|
      {
        lat: coachsession.latitude,
        lng: coachsession.longitude,
        info_window: render_to_string(partial: "info_window", locals: { coachsession: coachsession })
      }
    end
  end

  def show
    @coachsession = set_coachsession
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
