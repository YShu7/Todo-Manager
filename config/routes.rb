Rails.application.routes.draw do
    resources :groups do
        resources :tasks, :controller => 'group_tasks' do
            collection do
                post :bulk_destroy
                get :search
                #match "search" => "group_tasks#search", via: [:get, :post], as: :search
            end
        end
        collection do
            get "overview" => "groups#overview"
        end
    end
    root 'groups#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
