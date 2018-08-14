class ClaimsController < ApplicationController
  def index
    @claims = GiclClaim.limit(20).order(claim_id: :desc)
  end

  def show
  end
end
