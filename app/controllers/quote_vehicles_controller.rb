class QuoteVehiclesController < ApplicationController
  before_action :set_quote_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /quote_vehicles
  # GET /quote_vehicles.json
  def index
    @quote_vehicles = QuoteVehicle.all
  end

  # GET /quote_vehicles/1
  # GET /quote_vehicles/1.json
  def show
  end

  # GET /quote_vehicles/new
  def new
    @quote_vehicle = QuoteVehicle.new
  end

  # GET /quote_vehicles/1/edit
  def edit
  end

  # POST /quote_vehicles
  # POST /quote_vehicles.json
  def create
    @quote_vehicle = QuoteVehicle.new(quote_vehicle_params)

    respond_to do |format|
      if @quote_vehicle.save
        format.html { redirect_to @quote_vehicle, notice: 'Quote vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @quote_vehicle }
      else
        format.html { render :new }
        format.json { render json: @quote_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quote_vehicles/1
  # PATCH/PUT /quote_vehicles/1.json
  def update
    respond_to do |format|
      if @quote_vehicle.update(quote_vehicle_params)
        format.html { redirect_to @quote_vehicle, notice: 'Quote vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote_vehicle }
      else
        format.html { render :edit }
        format.json { render json: @quote_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_vehicles/1
  # DELETE /quote_vehicles/1.json
  def destroy
    @quote_vehicle.destroy
    respond_to do |format|
      format.html { redirect_to quote_vehicles_url, notice: 'Quote vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote_vehicle
      @quote_vehicle = QuoteVehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_vehicle_params
      params.require(:quote_vehicle).permit(:quote_id, :vehicle_id)
    end
end
