class NamespacesController < ApplicationController
  load_and_authorize_resource

  def index
    @namespace = Namespace.all
  end

  def new
    @namespace = Namespace.new
  end

  def create
    @namespace = Namespace.new(namespace_params)
    

    respond_to do |format|
      if @namespace.save
        flash[:notice] = "Namespace został utworzony."
        format.html { redirect_to :action => :index }
      else
        flash[:error] = "Namespace nie został utworzony."
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit

  end

  def update
     respond_to do |format|
      if @namespace.update(namespace_params)
        format.html { redirect_to namespaces_path, notice: 'namespace was successfully updated.' }
        format.json { render :show, status: :ok, location: @namespace }
      else
        format.html { render :edit }
        format.json { render json: @namespace.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @namespace.destroy
    if @namespace.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to namespaces_path
    end
    
  end 

  def namespace_params
    params.require(:namespace).permit(:name, :description)
  end 



end