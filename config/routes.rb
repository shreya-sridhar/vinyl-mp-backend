Rails.application.routes.draw do
      resources :users
      resources :records
      resources :sell_records
      resources :order_records
      resources :orders

      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'

      get '/records-popular', :to => 'records#popular'
      get '/records-expensive', :to => 'records#expensive'

end
