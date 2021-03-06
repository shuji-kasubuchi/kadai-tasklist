class TasksController < ApplicationController
  before_action :set_task, only: [:show,:edit,:update,:destroy]
  
  def index
    @tasks=Task.all
  end
  def show
  end
  def new
    @task=Task.new
  end
  def create
    @task=Task.new(message_params)
    
    if @task.save
      flash[:success]="taskが正常に追加されました"
      redirect_to @task
    else
      flash.now[:danger]="taskが追加されませんでした"
      render :new
    end
  end
  def edit
  end
  def update
    if @task.update(message_params)
      flash[:success]="taskは更新されました"
      redirect_to @task
    else
      flash.now[:danger]="taskが更新できませんでした"
      render :edit
    end
  end
  def destroy
    @task.destroy
    
    flash[:success]="taskは正常に削除されました"
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task=Task.find(params[:id])
  end
  
  def message_params
    params.require(:task).permit(:content,:status)
  end
end
