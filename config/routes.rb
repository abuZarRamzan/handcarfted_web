Rails.application.routes.draw do

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  devise_for :users
  devise_scope :user do
    get  'artisan/sign_up', to: 'artisan/registrations#new',    as: :new_artisan_registration
    post 'artisan/sign_up', to: 'artisan/registrations#create', as: :create_artisan_registration
   #  ARTISAN SESSIONS
    get    'artisan/sign_in',  to: 'artisan/sessions#new',     as: :new_artisan_session
    post   'artisan/sign_in',  to: 'artisan/sessions#create',  as: :artisan_session
    delete 'artisan/sign_out', to: 'artisan/sessions#destroy', as: :destroy_artisan_session
   
  end
  authenticated :user do
    namespace :buyer do
      root to: 'dashboard#index', as: :root
    end

    namespace :artisan do
      root to: 'dashboard#index', as: :root
      resources :products
    end

    namespace :admin do
      root to: 'dashboard#index', as: :root
    end
  end


end
