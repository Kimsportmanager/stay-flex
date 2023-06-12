class RoomsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index

    if params[:query].present?
      @rooms = policy_scope(Room).search_by_title_and_address(params[:query])
    else
      @rooms = policy_scope(Room)
      authorize @rooms
    end
    @markers = @rooms.where.not(latitude: nil, longitude: nil).map do |boat|
      {
        lat: boat.latitude,
        lng: boat.longitude
      }
    end
  end

  def show
    @review = Review.new
    @booking = Reservation.new
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
      redirect_to boat_path(@room)
    else
      render :edit
    end
  end

  def destroy
    if @room.destroy
      redirect_to rooms_path(@rooms)
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
    params[:room].permit(:users_id, :city, :neighborhood, :room_number, :bathroom_number, :bed_number, :max_ccupants, :price, :room_pictures, :available_start_date, :available_end_date, :title, :description)
  end
end




  ## GET /rooms
  ##def index
    ## @rooms = Room.all
  ##end

  # GET /rooms/new
  ##def new
    ##@room = Room.new
  ##end

  # POST /rooms
  ##def create
   ## @room = Room.new(room_params)

   ## if @room.save
     ## redirect_to @room, notice: 'Room was successfully created.'
   ## else
     ## render :new
   ## end
  ##end

  # GET /rooms/:id
  ##def show
  #### @room = Room.find(params[:id])
  ##end

  # PATCH/PUT /rooms/:id
  ##def update
  ##  @room = Room.find(params[:id])

    ##if @room.update(room_params)
     ## redirect_to @room, notice: 'Room was successfully updated.'
   ## else
    ##  render :edit
    ##end
  ##end

  # DELETE /rooms/:id
  ##def destroy
   ## @room = Room.find(params[:id])
   ## @room.destroy

   ## redirect_to rooms_url, notice: 'Room was successfully destroyed.'
  ##end

  ####end