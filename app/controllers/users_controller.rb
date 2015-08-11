class UsersController < ApplicationController
before_action :set_user, only: %w(show edit update destroy)
helper_method :sort_column, :sort_direction

  def index
    @users = User.all.order(sort_column + ' ' + sort_direction)
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  def show
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end
  
  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :department)
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
end
