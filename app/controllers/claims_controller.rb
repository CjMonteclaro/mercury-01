class ClaimsController < ApplicationController

  def index
      @q = GiclClaim.search(params[:q])
      @claims = @q.result.includes(:giis_payee_classes, :giac_chk_release_infos, :gicl_clm_loss_exps)

    respond_to do |format|
      format.html{@claims = @q.result.order(loss_date: :desc).page(params[:page])}
      format.xlsx{ render xlsx: 'CLAIMS_TAT' }
    end
  end

  def index2
    @all_claims = GiclClaim.all.order(loss_date: :asc).limit(5000)
    @claims_by_year = @all_claims.group_by { |c| c.loss_date.beginning_of_year }

    render "index2"
  end

  def show
    @claim = GiclClaim.find(params[:id])
  end

end
