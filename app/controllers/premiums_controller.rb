class PremiumsController < ApplicationController
  before_action :set_premium, only: [:show, :edit, :update, :destroy]

  # GET /premiums
  # GET /premiums.json
  def index
    @premiums = Premium.all
  end

  # GET /premiums/1
  # GET /premiums/1.json
  def show
  end

  # GET /premiums/new
  def new
    @premium = Premium.new
  end

  # GET /premiums/1/edit
  def edit
  end

  # POST /premiums
  # POST /premiums.json
  def create
    @premium = Premium.new(premium_params)

    respond_to do |format|
      if @premium.save
        format.html { redirect_to @premium, notice: 'Premium was successfully created.' }
        format.json { render :show, status: :created, location: @premium }
      else
        format.html { render :new }
        format.json { render json: @premium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /premiums/1
  # PATCH/PUT /premiums/1.json
  def update
    respond_to do |format|
      if @premium.update(premium_params)
        format.html { redirect_to @premium, notice: 'Premium was successfully updated.' }
        format.json { render :show, status: :ok, location: @premium }
      else
        format.html { render :edit }
        format.json { render json: @premium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /premiums/1
  # DELETE /premiums/1.json
  def destroy
    @premium.destroy
    respond_to do |format|
      format.html { redirect_to premiums_url, notice: 'Premium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_premium
      @premium = Premium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def premium_params
      params.require(:premium).permit(:subline_id, :peril_id, :subline_factor, :coverage_limit, :coverage_duration, :premium, :prem_type, :taxed)
    end
end
