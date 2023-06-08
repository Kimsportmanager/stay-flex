class RoomsController < ApplicationController
  # GET /rooms
  def index
     @rooms = Room.all
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to @room, notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  # GET /rooms/:id
  def show
    @room = Room.find(params[:id])
  end

  # GET /rooms/:id/edit
  def edit
    @room = Room.find(params[:id])
  end

  # PATCH/PUT /rooms/:id
  def update
    @room = Room.find(params[:id])

    if @room.update(room_params)
      redirect_to @room, notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rooms/:id
  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to rooms_url, notice: 'Room was successfully destroyed.'
  end

  private

  def room_params
    params.require(:room).permit(:title, :description, :price)
  end
end
