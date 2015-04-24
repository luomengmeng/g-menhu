Rails.application.routes.draw do
  root 'frontend/home#index'
  namespace :frontend do
    resource :home do
        get :index
    end
  end

  namespace :backend do
    resources :admins, :articles, :categories
  end

end
