Rails.application.routes.draw do
  get 'failures/show'

  get 'failures/new'

  get 'failures/create'

  get 'failures/destroy'

  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/feed'
  devise_for :users
  resources :failures
  resources :failure_steps

  root 'static_pages#home'
end
