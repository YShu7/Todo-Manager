class GroupTasksController < ApplicationController
    # index, show, new, edit, create, update and destroy.
    before_action :set_group, :except => :overview
    before_action :set_task, :only => [:show, :edit, :update, :destroy]
    
    def index
        @tasks = @group.tasks
    end
    
    def show
        @group = @task.group_id
    end
    
    def new
        @task = @group.tasks.build
    end
    
    def edit
    end
    
    def create
        @task = @group.tasks.build(task_params)
        if @task.save
            redirect_to :action => :index
        else
            render :action => :new
        end
    end
    
    def update
        if @task.update(task_params)
            redirect_to :action => :index
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
    
    def set_group
        @group = Group.find(params[:group_id])
        @head = @group.name
    end
    
    def set_task
        @task = @group.tasks.find(params[:id])
    end
end
    
