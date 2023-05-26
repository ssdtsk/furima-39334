class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = item.new
  end

  def edit
  end

  def update
    @item = item.find(params[:id])
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :last_name, :first_name, :first_name_kana,:last_name_kana,:birthday)
  end

end