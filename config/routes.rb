Rails.application.routes.draw do
    resources :groups do
        resources :tasks, :controller => 'group_tasks'
        collection do
            get "overview" => "groups#overview"
        end
    end
    root 'groups#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
