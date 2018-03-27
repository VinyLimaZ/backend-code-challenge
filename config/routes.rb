Rails.application.routes.draw do
  post '/distance', to: 'distance#create'
  get 'cost', to: 'cost#show'
end
