Rails.application.routes.draw do

  get 'home' => 'static_pages#home'
  get 'what_we_learn' => 'static_pages#what'
  root 'static_pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' =>'sessions#destroy'
  get 'feedback' => 'comments#index'
  get 'dashboard' => 'users#dashboard'
  get 'edit_user_comment' => 'comments#edit'
  get 'assign' => 'bids#assign'
  get 'apply' =>  'applicants#new'
  post 'apply' =>  'applicants#create'
  get 'accept' => 'applicants#accept'
  get 'profiles' =>'users#pride'
  resources :applicants, except: [:edit, :update]
  resources :bids
  resources :projects
  resources :assignments, only: [:index,:edit, :new, :create, :update]
  resources :users, except: [:new] do
    resources :comments, except: [:index]
  end
end
