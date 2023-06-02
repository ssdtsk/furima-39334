class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      @user = User.new(params.require(:user).permit(:nickname, :email, :encrypted_password, :last_name, :first_name, :first_name_kana,:last_name_kana,:birthday,))
    else
      render 'new'
    end

  
    def show
      @user = User.find(params[:id])
    end
  end
end
