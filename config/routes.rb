Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  resources :empresas, except: [:new]
  resources :sucursals
  resources :empleados

  get 'empresas', to: "empresas#new"
  get 'signup', to: "empresas#new"

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
