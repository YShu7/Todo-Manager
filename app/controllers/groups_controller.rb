class GroupsController < ApplicationController
    # index, show, new, edit, create, update and destroy
    before_action :set_group, :only => [:edit, :update, :destroy]
    def index
        @groups = Group.all
    end
    
    def overview
        @tasks = Task.all
    end
    
    def new
        @group = Group.new
    end
    
    def edit
    end
    
    def create
        @group = Group.new(group_params)
        @group.save
        
        redirect_to root_path
    end
    
    def update
        @group.update(group_params)
        
        redirect_to group_tasks_path(@group.id)
    end
    
    def destroy
        @group.destroy
        
        redirect_to group_tasks_path(@group.id)
    end
    
    private
    
    def set_group
        @group = Group.find(params[:id])
    end
    
    def group_params
        params.require(:group).permit(:name)
    end
end
