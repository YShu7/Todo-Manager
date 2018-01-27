class GroupsController < ApplicationController
    # index, show, new, edit, create, update and destroy
    before_action :authenticate_user!
    before_action :set_groups
    before_action :set_group, :only => [:edit, :update, :destroy]
    before_action :set_groups_and_search

    
    def index
    end
    
    def overview
        @q = Task.ransack(params[:q])
        @tasks = current_user.tasks
    end
    
    def new
        @group = current_user.groups.build
    end
    
    def edit
    end
    
    def create
        @group = current_user.groups.build(group_params)
        @group.user = current_user
        if @group.save
            redirect_to :action => :index
        else
            render :action => :new
        end
    end
    
    def update
        if @group.update(group_params)
            redirect_to group_tasks_path(@group.id)
        else
            render :action => :edit, :id => @group
        end
    end
    
    def destroy
        if @group.id == current_user.groups.first.id
            flash[:alert] = "Group " + @group.name + " cannot be deleted."
        else
            @group.destroy
            flash[:alert] = "Group " + @group.name + " was successfully deleted!"
        end
        
        redirect_to groups_path
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
        params.require(:group).permit(:name, :user_id)
    end
    
    def set_groups_and_search
        @q = Task.ransack(params[:q])
    end
    
    def set_groups
        @groups = current_user.groups
    end
end
