Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
    # resources :cocktails do
    #   resources :doses
    # end

    resources :cocktails do
      resource :doses, only: [:new, :create, :edit, :update]
    end

    resources :doses, only: [:destroy]
    end
