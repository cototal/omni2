Rails.application.routes.draw do
  namespace :admin do
    get "/" => "dashboard#index"

    namespace :notes do
      resources :entries, except: [:index, :show]
      resources :categories, except: [:index, :show]
      resources :sequences, except: [:index, :show]
    end
    namespace :allowance do
      resources :entries, path: "/" do
        collection do
          get :autocompleter
          get :merge
          put :merger
        end
      end
      resources :tasks, except: [:index, :show]
    end
  end
  devise_for :users
  namespace :notes do
    get "/" => "dashboard#index"
    resources :entries, only: [:index, :show]
    resources :categories, only: [:index, :show]
    resources :sequences, only: [:index, :show]
  end
  root "home#index"
end
