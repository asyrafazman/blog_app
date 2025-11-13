class ProfilesController < ApplicationController
  before_action :authenticate_user!

  # GET /profile
  def show
    @user = current_user
  end
  
  # GET /profile/edit
  def edit
    @user = current_user
  end

  # PATCH/PUT /profile
  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to profile_path, notice: 'Profile was successfull updated.'
    else
      render :edit, status: :inprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
