class TasksController < ApplicationController
    # index, show, new, edit, create, update and destroy.
    before_action :set_task, :only => [:show, :edit, :update, :destroy]
    def index
        @tasks = Task.all
    end
    
    def show
    end
    
    def new
        @task = Task.new
    end
    
    def edit
    end
    
    def create
        @task = Task.new(task_params)
        @task.save
        
        if @task.save
            redirect_to :action => :index
        else
            render :action => :new
        end
    end
    
    def update
        @task.update(task_params)
        if @task.save
            redirect_to :action => :show, :id => @task
        else
            render :action => :edit, :id => @task
        end
    end
    
    def destroy
        @task.destroy
        
        redirect_to :action => :index
    end
    
    private

    def task_params
        params.require(:task).permit(:text, :group_id, :ddl)
    end
    
    def set_task
        @task = Task.find(params[:id])
    end
end
