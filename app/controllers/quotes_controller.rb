class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new
    @quote_perils = @quote.perils.build
    @quote_charges = @quote.charge_rates.build
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        @quote.compute_premium
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quote.update(quote_params)
        @quote.compute_premium
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_quote
      @quote = Quote.find(params[:id])
    end

    def quote_params
      params.require(:quote).permit(:subline_id, :peril_id, :premium_id, :coverage_limit, :coverage_duration, :base_prem, :total_charges, :gross_prem,
        quote_perils_attributes: [:id, :quote_id, :peril_id, :sum_insured, :premium, :_destroy],
        quote_charges: [:id, :quote_id, :charge_rate_id, :charge_type_id, :charge_amount, :_destroy],
        charge_rates: [:id, :charge_type_id, :qualifier, :rate, :rate_type, :_destroy]
        )
    end
end
