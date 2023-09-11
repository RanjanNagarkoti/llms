Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'

  constraints(AdminConstraint.new) do
    resources :users, only: %i[index show destroy]

    scope :event do
      resources :types
    end

    resources :events
  end

  # Routes for users & presenters
  get '/events', to: 'pages#event', as: :user_home
  get '/events/:id', to: 'pages#show', as: :user_event

  post '/events/:event_id/comments', to: 'comments#create', as: :comments
  get '/events/:event_id/comments/new', to: 'comments#new', as: :new_comment
  delete '/events/:event_id/comments/:id', to: 'comments#destroy', as: :comment
end
