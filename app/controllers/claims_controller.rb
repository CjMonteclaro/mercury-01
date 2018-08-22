class ClaimsController < ApplicationController

  def index
      @q = GiclClaim.search(params[:q])
      @claims = @q.result

    respond_to do |format|
      format.html{@claims = @q.result.order(loss_date: :desc).page(params[:page])}
      format.xlsx{ render xlsx: 'CLAIMS_TAT' }
    end
  end

  def show
    @claim = GiclClaim.find(params[:id])
  end

end
