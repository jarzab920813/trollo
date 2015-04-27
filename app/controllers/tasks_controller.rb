class TasksController < ApplicationController
  load_and_authorize_resource

  # z jakiegoś powodu akcje edit oraz destroy wyszukują zadania o id params[:id] zamiast z params[:task_id]

  def index
    @tasks = Project.find(params[:id]).tasks
  end

  def create
    @task = Task.new(task_params)
    @task.project_id = params[:id]
    @users = User.where(:id => params[:users])
    @task.users << @users
    afsdfsdfdf
    # respond_to do |format|
    #   format.js
    # end
      if @task.save
        # flash[:notice] = "Zadanie zostało utworzone."
        redirect_to tasks_path
      end
    #   else
    #     flash[:error] = "Zadanie nie zostało utworzone."
    #     format.html { render :new }
    #   end
    # end
  end

  def new
    @task = Task.new
    @users = User.all
  end

  def edit
    @task = Project.tasks.find(params[:task_id])
    @users = User.all
  end

  def show
  end

  def update
    @task.users.destroy_all
    @users = User.where(:id => params[:users])
    @task.users << @users
    if Task.update(params[:task_id], task_params)
      redirect_to tasks_path
    end

  end

  def destroy
    @task = Task.find(params[:task_id])
    egeszege
    if @task.destroy
      redirect_to tasks_path
    end
  end

  protected

  def task_params
    params.require(:task).permit(:title,:description,:date_end,:priority,:users)
  end

end
