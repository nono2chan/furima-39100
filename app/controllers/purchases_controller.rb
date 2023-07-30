class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])

    #ログイン状態の場合でも、自身が出品していない売却済み商品の商品購入ページへ遷移しようとすると、トップページに遷移すること。
    #ログイン状態の場合でも、自身が出品した商品の商品購入ページに遷移しようとすると、商品の販売状況に関わらずトップページに遷移すること。
    if Purchase.find_by(item_id: @item.id)
      redirect_to root_path
    end
    # binding.pry
    
    @purchase_destination = PurchaseDestination.new
    
  end

  def create
    @item = Item.find(params[:item_id])
    # binding.pry
    @purchase_destination = PurchaseDestination.new(purchase_params)
    
    if @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

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

end