class GroupTasksController < ApplicationController
    # index, show, new, edit, create, update and destroy.
    before_action :find_group
    def index
        @head = @group.name
        @identity = @group.id
        @tasks = @group.tasks
    end
    
    def show
    end
    
    def new
        @task = @group.tasks.build
    end
    
    private
    
    def find_group
        @group = Group.find(params[:id])
    end

end
