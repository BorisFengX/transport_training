Rails.application.routes.draw do
  root to: 'domains#index'

  resources :domains, only: [:index, :show] do
  end

  resources :competencies, only: [:index, :show] do
    collection do
      get 'filter', to: 'competencies#filter'
    end
    resources :joins, only: [:new, :create, :destroy, :edit, :update]
  end

  resources :users do
  end
  resources :users, only: [:index, :show]do
  end
  # resources :cocktails do

  #   collection do
  #     get 'filter', to: 'cocktails#filter'
  #   end
  #   resources :doses, only: [:new, :create, :destroy]
  # end


  # root to: 'cocktails#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
