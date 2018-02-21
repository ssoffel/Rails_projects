class ArtworkSharesController < ApplicationController

  def index
    @shares = ArtworkShare.all
    render json: @shares
  end 

  def create
    @art_shares = ArtworkShare.new(artwork_params)
    if @art_shares.save!
      render json: @art_shares, status: :created
    else
      render json: @art_shares.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @art_shares = ArtworkShare.find(params[:id])
    @art_shares.destroy
    render json: @art_shares
  end


  private

  def artwork_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end
