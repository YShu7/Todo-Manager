class GroupsController < ApplicationController
    # index, show, new, edit, create, update and destroy
    def index
        @groups = Group.all
    end
    
    
end
