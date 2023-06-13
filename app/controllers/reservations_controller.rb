class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index

    if params[:query].present?
      @rooms = policy_scope(Room).search_by_title_and_address(params[:query])
    else
      @rooms = policy_scope(Room)
      authorize @rooms
    end
    @markers = @rooms.where.not(latitude: nil, longitude: nil).map do |room|
      {
        lat: room.latitude,
        lng: room.longitude
        # infoWindow: { content: render_to_string(partial: "/boats/map_box", locals: { boat: boat }) }
      }
    end
  end

  def show
    @review = Review.new
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
    authorize @room
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    authorize @room
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render :edit
    end
  end

  def destroy
    if @room.destroy
      redirect_to rooms_path(@room)
    else
      render :index
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
    authorize @room
  end

  def room_params
    params[:room].permit(:title, :price, :description, :available_start_date, :available_end_date, :address)
  end
end
