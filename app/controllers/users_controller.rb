class UsersController < ApplicationController
  load_and_authorize_resource

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

  def show
    @user = User.find(params[:id])
    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end
    
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end 

    protected

  def user_params
      params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation, :commit, :admin)
  end
   
  def admin?
    false
  end


end