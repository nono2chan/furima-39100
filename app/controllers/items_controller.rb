class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    # @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.create(item_params)
    # @item = current_user.items.build(item_params)

    # binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :text, :user_id, :genre_id, :quality_id, :payment_id, :prefecture_id, :days_id).merge(user_id: current_user.id)
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end
end
