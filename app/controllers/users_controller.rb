class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account created successfully!"
      redirect_to @user
    else
      flash.now[:alert] = "There was a problem with your sign-up."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_path unless current_user == @user
  end

  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      @user.destroy
      session[:user_id] = nil
      flash[:notice] = "Account deleted."
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end
