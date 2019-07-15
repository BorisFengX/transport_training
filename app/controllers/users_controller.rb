class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def filter
    # raise
    @users = User.where("name LIKE '%#{params[:name]}%'")
    # ("name LIKE '#{params[:name]}'")
  end


  def show
    @doses = Dose.where(user_id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
    # @user.save
    # redirect_to users_path(@user)
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.delete
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
