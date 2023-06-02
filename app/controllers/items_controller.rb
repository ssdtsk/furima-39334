class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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

  #def edit
    #@item = Item.find(params[:id])
  #end

 # def update
    #@item = Item.find(params[:id])
    #if @item.update(item_params)
      #redirect_to root_path
    #else
      #render :edit
    #end
  #end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :product_description, :product_detail_category_id, :product_detail_condition_id, :delivery_charge_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end