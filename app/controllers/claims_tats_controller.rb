class ClaimsTatsController < ApplicationController
  before_action :set_claims_tat, only: [:show, :edit, :update, :destroy]

  # GET /claims_tats
  # GET /claims_tats.json
  def index
    @claims_tats = ClaimsTat.all
  end

  # GET /claims_tats/1
  # GET /claims_tats/1.json
  def show
    @claim = GiclClaim.find(params[:id])
  end

  # GET /claims_tats/new
  def new
    @claims_tat = ClaimsTat.new
    @claim = GiclClaim.find(params[:id])
  end

  # GET /claims_tats/1/edit
  def edit
    @claim = GiclClaim.find(params[:id])
  end

  # POST /claims_tats
  # POST /claims_tats.json
  def create
    @claims_tat = ClaimsTat.new(claims_tat_params)

    respond_to do |format|
      if @claims_tat.save
        format.html { redirect_to @claims_tat, notice: 'Claims tat was successfully created.' }
        format.json { render :show, status: :created, location: @claims_tat }
      else
        format.html { render :new }
        format.json { render json: @claims_tat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claims_tats/1
  # PATCH/PUT /claims_tats/1.json
  def update
    respond_to do |format|
      if @claims_tat.update(claims_tat_params)
        format.html { redirect_to @claims_tat, notice: 'Claims tat was successfully updated.' }
        format.json { render :show, status: :ok, location: @claims_tat }
      else
        format.html { render :edit }
        format.json { render json: @claims_tat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /claims_tats/1
  # DELETE /claims_tats/1.json
  def destroy
    @claims_tat.destroy
    respond_to do |format|
      format.html { redirect_to claims_tats_url, notice: 'Claims tat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claims_tat
      @claims_tat = ClaimsTat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def claims_tat_params
      params.require(:claims_tat).permit(:genweb_claim_id, :completion_of_document, :assigned_to_adjuster, :approved, :loa, :out_from_shop, :received_invoice, :payment_request, :to_audit, :to_treasury, :with_estimate)
    end
end
