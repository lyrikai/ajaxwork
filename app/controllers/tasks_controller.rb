class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category

    if @task.save
      respond_to do |format|
        format.html { redirect_to books_path }
        format.js { }
      end
    else
      flash[:notice] = "Please try again"
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])
    if params[:status] == "true"
      params[:status] = true
    end
    ok = task_params
    puts "-" * 60
    puts params
    puts "-" * 60
    puts task_params
    puts "-" * 60
    puts ok
    ok.each do |i|
      puts i
    end
    puts "-" * 60
    
    puts "-" * 60
    
    @task.update(ok)
    redirect_to tasks_path
    flash[:notice] = "Task edited"
  end

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end


  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

  def category_params
    params.require(:Category)
  end

end
