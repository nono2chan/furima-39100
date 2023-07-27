class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  # before_action : only: [:edit, :show, :update, :destroy]

  def index
     @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    # @item = current_user.items.build(item_params)

    # binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.joins(:user).find(params[:id])
    if @item.user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @item = Item.joins(:user).find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
 
  def show
    @item = Item.joins(:user).find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :text, :genre_id, :quality_id, :payment_id, :prefecture_id, :days_id).merge(user_id: current_user.id)
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end
end
