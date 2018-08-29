class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new

    [1, 2].each do |peril|
      @quote.quote_perils.build(peril_id: peril)
    end

  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        @quote.compute_base_premium
        @quote.compute_charges_and_gross_prem
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
        @quote.compute_base_premium
        @quote.compute_charges_and_gross_prem
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
        charge_rate_ids: []
        )
    end
end
