class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :check_item_ownership, only: [:edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: 'アイテムが出品されました。'
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品情報が更新されました。'
    else
      render :edit
    end
  end

  def show
  end

  def edit
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :product_detail_category_id, :product_detail_condition_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def check_item_ownership
    if current_user != @item.user
      redirect_to root_path
    end
  end
end