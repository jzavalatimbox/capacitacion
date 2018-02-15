Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'empresas#new'

  #get 'signup', to: 'empresas#new'

  resources :empresas, except: [:new, :index]
  resources :sucursals
  resources :empleados


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
