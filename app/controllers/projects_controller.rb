class ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @project = Project.all
    # @project =Project.find(params[:namespace_id]) tutaj zeby wyyswietlalo namespace z tabeli laczacej


  end

  def new
    @project = Project.new
  

    
  end

  def create
    @project = Project.new(project_params)
    # @user = User.find(params[24])
    # @user.projects << @projects
    
    # respond_to do |format|
    #   format.js
    # end
      #if @project.save
        # flash[:notice] = "Namespace został utworzony."
      #  redirect_to projects_path
     # end
      respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Projekt został poprawnie dodany' }
        format.json { render :show, status: :ok, location: @project }

      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        red
      end
    end
    #   else
    #     flash[:error] = "Namespace nie został utworzony."
    #     format.html { render :new }
    #   end
    # end
  end

  def show
  respond_to do |format|
  format.html # show.html.erb
  format.xml { render :xml => @project.to_xml }
  end
  end

  def edit

  end

  def update
    
     respond_to do |format|
      if @project.update(project_params)
        #format.html { redirect_to projects_path, notice: 'Projekt został poprawnie zaktualizowany' }
        #format.json { render :show, status: :ok, location: @project }
        flash[:notice] = "Projekt został poprawnie zaktualizowany"
        format.html { redirect_to projects_path }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        red
      end
    end

  end

  def destroy
    @project.destroy
    respond_to do |format|
      if @project.destroy
        format.html { redirect_to projects_path, notice: 'Projekt został usuniety' }
        format.json { render :show, status: :ok, location: @project }

      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        red
      end
    end
    
  end 

  def project_params
    params.require(:project).permit(:name,:date_begin,:date_end,:description,:status,:namespace_id,:user_ids =>[])
  end
end