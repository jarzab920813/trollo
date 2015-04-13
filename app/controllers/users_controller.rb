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
    authorize! :update, User
    
  end

  def update
    if user_params[:password].blank?
      [:password, :password_confirmation, :current_password].collect{|p| params[:user].delete(p)}
    else
      @user.errors[:base] << "Niepoprawne hasło" unless current_user.valid_password?(user_params[:current_password])
    end

    respond_to do |format|
      if @user.errors.empty? and @user.update_attributes(user_params.except!(:current_password)) or @user.admin == 0
        flash[:notice] = "Your account has been updated"
        format.json { render :json => @user.to_json, :status => 200 }
        format.xml  { head :ok }
        format.html { render :action => :edit }
      else
        format.json { render :text => "Could not update user", :status => :unprocessable_entity } #placeholder
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        format.html { render :action => :edit, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(current_user.id)
    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end
    
  def destroy
    @user = User.find(params[:id])
    authorize! :delete, User
    if @user.admin?
      flash[:notice] = "Cannot delete Admins."
      redirect_to root_path
    else
      if @user.destroy
        flash[:notice] = "Successfully deleted User."
        redirect_to root_path
      end
    end
  end 

    protected

  def user_params
      params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation, :current_password, :commit, :admin)
  end


end