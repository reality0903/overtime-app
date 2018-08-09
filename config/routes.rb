Rails.application.routes.draw do
  resources :audit_logs, except: [:new, :edit, :destory] do
    member do
      get :confirm
    end
  end

  namespace :admin do
    resources :users
		resources :posts
		resources :admin_users
    resources :employees

    root to: "users#index"
  end

  resources :posts do
    # provides the approve_post path GET
    member do
      get :approve
    end
  end

  # skip: [:registrations] removes devise's registration functionality
  devise_for :users, skip: [:registrations]
  root to: 'static#homepage'
end
