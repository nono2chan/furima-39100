class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.includes(:purchase).order('items.created_at DESC')
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)

    # binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    if @item.user.id != current_user.id || @item.purchase != nil 
      redirect_to root_path
    end

  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
 
  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :text, :genre_id, :quality_id, :payment_id, :prefecture_id, :days_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.joins(:user).includes(:purchase).find(params[:id])
  end
end
