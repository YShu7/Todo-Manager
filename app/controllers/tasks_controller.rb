class TasksController < ApplicationController
    # index, show, new, edit, create, update and destroy.
    before_action :set_task, :only => [:show, :edit, :update, :destroy]
    def index
        @tasks = Task.all
    end
    
    def show
        @head = Group.find(@task.group_id).name
    end
    
    def new
        @task = Task.new
    end
    
    def edit
    end
    
    def create
        @task = Task.new(task_params)
        @task.save
        flash[:notice] = "Task was successfully added!"
        
        if @task.save
            redirect_to :action => :index
        else
            render :action => :new
        end
    end
    
    def update
        @task.update(task_params)
        flash[:notice] = "Task was successfully updated!"
        if @task.save
            redirect_to :action => :show, :id => @task
        else
            render :action => :edit, :id => @task
        end
    end
    
    def destroy
        @task.destroy
        flash[:alert] = "Task was successfully deleted!"
        
        redirect_to :action => :index
    end
    
    private

    def task_params
        params.require(:task).permit(:text, :group_id, :ddl, :emergency)
    end
    
    def set_task
        @task = Task.find(params[:id])
    end
end
