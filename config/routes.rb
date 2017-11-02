Rails.application.routes.draw do
  resources :posts do
    member do
      get 'new_comment', to: 'comments#new', as: 'new_comment'
    end
  end

  post 'post/:post_id/create_comment', to: 'comments#create_comment', as: 'create_comment'

  post 'post/:post_id/destroy/:comment_id', to: 'comments#destroy_comment', as: 'destroy_comment'

  devise_for :users
  # devise_for :users, controllers: {sessions: 'users/sessions'}

  root 'posts#index'
end
