Rails.application.routes.draw do
	root 'home#index'
	get '/auth/:provider/callback', to: 'sessions#create'
  resources :tweets
  get '/logout', to: 'sessions#destroy', name: 'logout'
  
  
  get '/about', to: 'home#about'
  
  get '/analytics', to: 'tweets#analytics'
end
