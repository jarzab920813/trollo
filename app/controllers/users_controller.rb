class UsersController < ApplicationController
  load_and_authorize_resource

  before_filter do
    @user = User.find(current_user.id)
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    unless current_user.id == @user.id 
      if current_user.admin? and @user.admin? then
       redirect_to root_path 
     end
    end
    
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end 

  def show_profile
    @user = User.find(current_user.id)
  end

  def edit_profile
    @user = User.find(current_user.id)
    render :action => 'edit'
  end

  def destroy_confirm
    if params[:id].present?
      @user = User.find(params[:id])
    end
  end

  def destroy_with_password
    if params[:id].present?
      @user = User.find(params[:id])
    end
    @user.errors[:base] << "Niepoprawne hasło" unless current_user.valid_password?(user_params[:password])

    if @user.errors.empty? and @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path

    else
      if params[:id].present?
        redirect_to destroy_user_confirm_user_path
      else
        redirect_to destroy_confirm_users_path
      end
    end
  end

  def change_password

  end

  def change_users_password
    @user = User.find(params[:id])
    render 'users/change_password'
  end

  protected

  def user_params
      params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation, :admin,:commit)
  end


end