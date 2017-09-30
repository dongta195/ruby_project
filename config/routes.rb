Rails.application.routes.draw do
  devise_for :admins, skip: [:sessions, :passwords]
  devise_scope :admin do
    get "/admin/login" => "admin/sessions#new", as: :admin_session
    post "/admin/login" => "admin/sessions#create", as: :admin_login
    get "/admin/logout" => "admin/sessions#destroy", as: :admin_logout
  end

  authenticated do
    devise_scope :admin do
      namespace :admin do
        root to: "top_page#show", as: :root
        resources :brands, only: [:new, :create]
        resources :buyers, only: [:new, :create, :index]
      end
    end
  end

  unauthenticated do
    devise_scope :admin do
      namespace :admin do
        root to: "sessions#new", as: :unauthenticated
      end
    end
  end

  get "/zipcode" => "zipcodes#index", default: {format: :json}
end
