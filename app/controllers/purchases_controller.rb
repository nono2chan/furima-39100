class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :find_item, only: [:index, :create]
  before_action :sold_out_check, only: [:index]

  
  def index

    if @item.user_id == current_user.id
      redirect_to root_path
    end
    @purchase_destination = PurchaseDestination.new
    
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    
    if @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_destination).permit(:token, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def sold_out_check
    @purchase = Purchase.find_by(item_id: params[:item_id])
    if @purchase
      redirect_to root_path
    end
  end

end