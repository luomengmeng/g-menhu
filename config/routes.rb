Rails.application.routes.draw do
  # mount Ckeditor::Engine => "/ckeditor"

    root 'frontend/home#index'
    # root 'frontend/article#show'
    namespace :frontend do
        resource :home do
            get :index

        end
        resource :article do
            get :show

        end
    end


    namespace :backend do
        resources :admins, :articles, :categories, :users, :login, :navigations, :provinces, :tags
    end
    # resources :login
    # get 'login', to: 'login#login'
    get        'login'   => 'session#new'
    get        'logout'  => 'session#destroy'
    post      'login'   => 'session#create'
    delete   'logout'  => 'session#destroy'
    resources :users


end
