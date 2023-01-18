class Api::V1::BikesController < ApplicationController
  before_action :set_bike, only: %i[show update destroy]

  # GET /bikes
  def index
    @bikes = Bike.all

    render json: @bikes
  end

  # GET /bikes/1
  def show
    render json: @bike
  end

  # POST /bikes
  def create
    @bike = Bike.new(bike_params)

    if @bike.save
      render json: @bike, status: :created, location: @bike
    else
      render json: @bike.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bikes/1
  def update
    if @bike.update(bike_params)
      render json: @bike
    else
      render json: @bike.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bikes/1
  def destroy
    @bike = Bike.find(params[:id])
    if @bike.destroy
      render json: { message: "Bike deleted successfully" }, status: :no_content
      else
      render json: @bike.errors, status: :unprocessable_entity
      end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bike
    @bike = Bike.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bike_params
    params.require(:bike).permit(:name, :bike_image, :bike_type, :description, :brand, :daily_rate)
  end
end
