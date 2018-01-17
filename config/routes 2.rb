Rails.application.routes.draw do
    get 'welcome/index'
    resources :groups do
        resources :tasks, :controller => "group_tasks"
    end
    get 'all/tasks' => 'group_tasks#all'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
