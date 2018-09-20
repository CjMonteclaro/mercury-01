class ChargeRatesController < ApplicationController
  before_action :set_charge_rate, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /charge_rates
  # GET /charge_rates.json
  def index
    @charge_rates = ChargeRate.all
  end

  # GET /charge_rates/1
  # GET /charge_rates/1.json
  def show
  end

  # GET /charge_rates/new
  def new
    @charge_rate = ChargeRate.new
  end

  # GET /charge_rates/1/edit
  def edit
  end

  # POST /charge_rates
  # POST /charge_rates.json
  def create
    @charge_rate = ChargeRate.new(charge_rate_params)

    respond_to do |format|
      if @charge_rate.save
        format.html { redirect_to @charge_rate, notice: 'Charge rate was successfully created.' }
        format.json { render :show, status: :created, location: @charge_rate }
      else
        format.html { render :new }
        format.json { render json: @charge_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charge_rates/1
  # PATCH/PUT /charge_rates/1.json
  def update
    respond_to do |format|
      if @charge_rate.update(charge_rate_params)
        format.html { redirect_to @charge_rate, notice: 'Charge rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @charge_rate }
      else
        format.html { render :edit }
        format.json { render json: @charge_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charge_rates/1
  # DELETE /charge_rates/1.json
  def destroy
    @charge_rate.destroy
    respond_to do |format|
      format.html { redirect_to charge_rates_url, notice: 'Charge rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge_rate
      @charge_rate = ChargeRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_rate_params
      params.require(:charge_rate).permit(:charge_type_id, :qualifier, :rate, :rate_type)
    end
end
