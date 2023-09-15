# frozen_string_literal: true

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
    get '/events', to: 'events#index', as: :admin_home
  end

  # Routes for users & presenters
  get '/events', to: 'pages#event', as: :user_home
  get '/events/:id', to: 'pages#show', as: :user_event

  post '/events/:event_id/comments', to: 'comments#create', as: :comments
  get '/events/:event_id/comments/new', to: 'comments#new', as: :new_comment
  delete '/events/:event_id/comments/:id', to: 'comments#destroy', as: :comment
  get '/events/:event_id/comments/:id/edit', to: 'comments#edit', as: :edit_comment
  patch '/events/:event_id/comments/:id', to: 'comments#update', as: :update_comment

  get '/events/:id/edit', to: 'events#edit_material'
  patch '/events/:id', to: 'events#update_material'
  delete '/events/:id/material/:material_id', to: 'events#destroy_material', as: :delete_material

  resources :events, only: %i[index] do
    resources :participants, only: %i[new create destroy]
  end

  get '/events/all/status', to: 'pages#filter_event', as: :event_filter
  get '/user/profile/:id', to: 'users#show', as: :user_profile
end
