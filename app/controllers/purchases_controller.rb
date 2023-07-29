class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new
    
  end

  def create
    @item = Item.find(params[:item_id])
    # binding.pry
    @purchase_destination = PurchaseDestination.new(purchase_params)
    
    if @purchase_destination.valid?
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  def purchase_params
    params.require(:purchase_destination).permit(:card_number,:card_exp_month,:card_exp_year, :card_cvc ,:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end