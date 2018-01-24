class GroupsController < ApplicationController
    # index, show, new, edit, create, update and destroy
    before_action :set_group, :only => [:edit, :update, :destroy]
    before_action :set_groups_and_search
    def index
        @groups = Group.all
    end
    
    def overview
        @q = Task.ransack(params[:q])
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
        if @group.id == 3
            flash[:alert] = "Group " + @group.name + " cannot be deleted."
        else
            @group.destroy
            flash[:alert] = "Group " + @group.name + " was successfully deleted!"
        end
        
        redirect_to root_path
    end
    
    def search
        @q = params[:q] if params[:q].present?
        @search_criteria = {text_cont: @q}
        if @q.present?
            @tasks = Task.ransack(@search_criteria).result(:distinct => true)
        end
    end
    
    private
    
    def set_group
        @group = Group.find(params[:id])
    end
    
    def group_params
        params.require(:group).permit(:name)
    end
    
    def set_groups_and_search
        @groups = Group.all
        @q = Task.ransack(params[:q])
    end
end
