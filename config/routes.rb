Rails.application.routes.draw do
  # mount Ckeditor::Engine => "/ckeditor"

    root 'frontend/home#index'
    # root 'frontend/article#show'
    namespace :frontend do
        resources :articles, :news, :navigations, :columns
    end

    namespace :backend do
        resources :admins, :articles, :categories, :users, :login, :navigations, :provinces, :tags,
         :investigates, :lines, :problems, :abroads, :stations, :titles
    end

    get        'login'   => 'session#new'
    get        'logout'  => 'session#destroy'
    post      'login'   => 'session#create'
    delete   'logout'  => 'session#destroy'
    resources :users
    get '/navigations'=>'frontend/navigations#ajax'


end
