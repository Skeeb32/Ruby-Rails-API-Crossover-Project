class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all
    render json: @events
  end

  # GET /events/1
  def show
    @event = Event.find(params[:id])
    render json @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: { error: 'Unable to create Event.' }, status: 422
    end
  end

  # PATCH/PUT /events/1
  def update
      @event = Event.find(params[:id])
      if @event
        @event.update(event_params)
        render json: {message: 'Event successfully updated.' }, status: 200
      else
        render json { error: 'Unable to update Event' }, status: 422
      end
  end

  # DELETE /events/1
  def destroy
    @event = Event.find(params[:id])
      if @event
          @event.destroy
          render json: {message: 'Event successfully deleted.' }, status: 200
        else
          render json { error: 'Unable to delete Event' }, status: 422
        end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def event_params
      params.require(:event).permit(:name, :event_type, :at, :button_color)
    end
end