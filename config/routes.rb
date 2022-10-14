# frozen_string_literal: true

require 'sidekiq/web'
Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
  root to: 'welcome#index'

  scope 'api/v1' do
    devise_for(
      :users,
      controllers: {
        confirmations: 'api/v1/users/confirmations',
        sessions: 'api/v1/users/sessions',
        invitations: 'api/v1/users/invitations',
        omniauths: 'api/v1/users/omniauths',
        passwords: 'api/v1/users/passwords',
        registrations: 'api/v1/users/registrations',
        unlocks: 'api/v1/users/unlocks'
      },
      defaults: { format: :json }
    )
  end

  namespace :api, defaults: { format: :html } do
    namespace :v1 do
      authenticate :user, ->(u) { u.admin? } do
        mount Sidekiq::Web => '/sidekiq'
      end
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      concern :attachable do
        resources :attachments
      end

      concern :imageable do
        resources :photos
      end

      concern :clipable do
        resources :videos
      end

      concern :likeable do
        resources :likes
      end

      concern :commentable do
        resources :comments
      end

      concern :suggestable do
        resources :suggestions
      end

      concern :followable do
        resources :followers
      end

      concern :followingable do
        resources :followings
      end

      resources :profiles, concerns: :imageable
      resources :roles
      resources :users, concerns: [:followable, :followingable], shallow: true do
        resources :groups, only: :index
        collection do
          get :profile
        end
      end
      resources :groups, only: [:show, :create, :destroy, :update], concerns: :followable do
        resources :posts, only: [:index, :create]
      end
      resources :notifications, only: %i[index show]
      resources :categories
      resources :posts, concerns: %i[commentable likeable suggestable], shallow: true do
        resources :petitions, only: [:index, :create, :destroy]
        resources :opinions, only: :index
        resources :reports, only: [:index, :create]
      end
      resources :comments, concerns: [:likeable]
      resources :suggestions, concerns: [:likeable]
      resources :options, only: [] do
        resources :opinions
      end
    end
  end
end
