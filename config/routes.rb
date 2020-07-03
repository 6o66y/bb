Rails.application.routes.draw do
  namespace :public do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  devise_for :users, :controller => {
  	:registrations => 'users/registrations',
  	:sessions => 'users/sessions'
  }

  devise_scope :user do
  	get 'sign_in', :to => 'users/sessions#new'
  	get 'sign_out', :to => 'users/sessions#destroy'
  end

  scope module: :public do
  	resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end
end
