class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User
    return if params[:search].blank?

    @users = User.where(" lower(last_name) || lower(first_name) || lower(email) || id LIKE :search", search: "%#{params[:search].downcase}%") 
  end

  def new
    @user= User.new
  end

  def create
    @user= User.new(user_params)
    @user.skip_password_validation
    if @user.save
      redirect_to admin_users_path
    else
      render :new 
    end  
  end
  
  def show; end
  
  def edit
  end
  
  def update
    @user.skip_password_validation
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
    else
      
      render :edit  
    end
  end
  
  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  # def search
  #   if params[:search].blank?
  #     redirect_to admin_users_path and return
  #   else
  #     @parameter= params[:search].downcase
  #     @results= User.all.where("lower(first_name) LIKE :search", search: "%#{@parameter}%")
  #   end  
  # end

  private
    def user_params
      params.require(:user).permit(:first_name, :email, :phone_number)
    end
  
  def set_user
    @user = User.find(params[:id])
  end    
end