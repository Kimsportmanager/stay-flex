Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   devise_for :users

   root to: 'pages#home'

   get 'dashboard', to: 'dashboard#index'
   resources :rooms, only: :update

   resources :rooms do
     resources :reservation, only: [ :new, :create, :show ]
     resources :reviews, only: [ :new, :create, :show ]
   end

   resources :reservations, only: [ :show ]

end

#Rails.application.routes.draw do
  #devise_for :users
  #root to: "pages#home"
  #ressources :rooms,

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Route for new user registration
  #get '/users/new', to: 'users#new', as: 'new_user'
  #post '/users', to: 'users#create'

  # Routes for user login and logout
  #get '/login', to: 'sessions#new'
  #post '/login', to: 'sessions#create'
  #get '/logout', to: 'sessions#destroy'

  # Route for creating a new room
  #get '/rooms/new', to: 'rooms#new'
  #post '/rooms', to: 'rooms#create'

  # Route for showing a specific room
  #get '/rooms/:id', to: 'rooms#show', as: 'room'

  # Routes for creating a new reservation
  #get '/rooms/:id/reservations/new', to: 'reservations#new'
  #post '/rooms/:id/reservations', to: 'reservations#create'

  # Route for creating a review for a reservation
  #post '/reservations/:id/reviews', to: 'reviews#create'

  # Route for showing a specific user
  #get '/users/:id', to: 'users#show', as: 'user'

  # Route for showing reviews of a specific user
  #get '/users/:id/reviews', to: 'reviews#index'

  # Route for creating a new review for a reservation
  #get '/reservations/:id/reviews/new', to: 'reviews#new'

  # Defines the root path route ("/")
  # root "articles#index"
#end
