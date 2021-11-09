class Api::UsersController < ApplicationController

  def update

    if current_user.update(user_params)
      bypass_sign_in current_user
      render json: { user: current_user }, status: :ok
    else
      render json: { message: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def user_params
    user_params = params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
    )

   if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation) if user_params[:password_confirmation].blank?
   end
    user_params
  end
end
