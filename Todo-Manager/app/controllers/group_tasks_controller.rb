class GroupTasksController < ApplicationController
    # index, show, new, edit, create, update and destroy.
    before_action :set_group, :except => :bulk_destroy
    before_action :set_task, :only => [:show, :edit, :update, :destroy]
    before_action :set_search
    before_action :authenticate_user!

    def index
        @tasks = @group.tasks
    end
    
    def show
        @group = @task.group_id
    end
    
    def new
        @task = Task.new
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
    
    def bulk_destroy
        ids = Array(params[:ids])
        tasks = ids.map{|id| Task.find_by_id(id)}
        tasks.each{ |t| t.destroy}
        
        redirect_to overview_groups_path
    end
    
    private
    
    def task_params
        params.require(:task).permit(:text, :group_id, :ddl, :emergency)
    end
    
    def set_group
        @groups = Group.all
        @group = Group.find(params[:group_id])
        @head = @group.name
    end
    
    def set_task
        @task = @group.tasks.find(params[:id])
    end
    
    def set_search
        @q = Task.ransack(params[:q])
    end
end
    
