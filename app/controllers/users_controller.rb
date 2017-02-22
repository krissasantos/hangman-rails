class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  def index

  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
 
    @user = User.find(params[:id])
    @user.set_difficulty = params[:difficulty].to_i
    @user.set_maxLength = params[:maxLength].to_i
    
    if current_user.id == @user.id
        flash[:success] = "Saved"
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def update
    # raise params.inspect
    @user = User.find(params[:id])
    @user.update(set_difficulty: params[:set_difficulty], set_maxLength: params[:set_maxLength])
    redirect_to user_path(@user)
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :age)
  end

end
