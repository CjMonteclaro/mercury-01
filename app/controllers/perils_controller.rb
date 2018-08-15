class PerilsController < ApplicationController
  before_action :set_peril, only: [:show, :edit, :update, :destroy]

  # GET /perils
  # GET /perils.json
  def index
    @perils = Peril.all
  end

  # GET /perils/1
  # GET /perils/1.json
  def show
  end

  # GET /perils/new
  def new
    @peril = Peril.new
  end

  # GET /perils/1/edit
  def edit
  end

  # POST /perils
  # POST /perils.json
  def create
    @peril = Peril.new(peril_params)

    respond_to do |format|
      if @peril.save
        format.html { redirect_to @peril, notice: 'Peril was successfully created.' }
        format.json { render :show, status: :created, location: @peril }
      else
        format.html { render :new }
        format.json { render json: @peril.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perils/1
  # PATCH/PUT /perils/1.json
  def update
    respond_to do |format|
      if @peril.update(peril_params)
        format.html { redirect_to @peril, notice: 'Peril was successfully updated.' }
        format.json { render :show, status: :ok, location: @peril }
      else
        format.html { render :edit }
        format.json { render json: @peril.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perils/1
  # DELETE /perils/1.json
  def destroy
    @peril.destroy
    respond_to do |format|
      format.html { redirect_to perils_url, notice: 'Peril was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peril
      @peril = Peril.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def peril_params
      params.require(:peril).permit(:line_id, :name, :shortname, :from, :to)
    end
end
