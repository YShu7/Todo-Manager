Rails.application.routes.draw do
  devise_for :users
    resources :groups do
        resources :tasks, :controller => 'group_tasks' do
            collection do
                post :bulk_destroy
            end
        end
        collection do
            get "overview" => "groups#overview"
            get :search
        end
    end
    root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
