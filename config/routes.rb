Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'
  resources :users, only: %i[index show destroy], constraints: AdminConstraint.new
  scope :event do
    resources :types, constraints: AdminConstraint.new
  end
end
