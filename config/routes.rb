Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # [TODO] how direct routes works
  # direct :admin do
  #   { controller: "admins/categories", action: "index" }
  # end

  # direct :customer do 
  #   { controller: "customers/products", action: "index" }
  # end
  devise_scope :user do
    authenticated :user do
      constraints RoleRouteConstraint.new do |user|
        if user.is_a?(Admin)
          root 'categories#index',   as: :authenticated_root
        else
          root 'products#index',   as: :authenticated_root
        end
      end
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  
  resources :categories
  resources :products
  

 


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  
end
