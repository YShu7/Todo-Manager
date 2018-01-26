class WelcomeController < ApplicationController
    def index
        if current_user
            @groups=current_user.groups
        end
    end
end
