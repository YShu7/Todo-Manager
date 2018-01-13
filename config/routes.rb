Rails.application.routes.draw do
    get 'welcome/index'
    resources :groups
    resources :tasks
    get 'task' => 'group_tasks#index'
    resources :group_tasks
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
