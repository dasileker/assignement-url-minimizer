Rails.application.routes.draw do
  root 'urls#new'

  post '/urls', to: 'urls#create', as: 'urls'
  get '/urls/:id', to: 'urls#show', as: 'url'

  get '/metrics', to: 'urls#redirect_to_url', as: 'redirect'

  get '/metrics/stat', to: 'analitics#show', as: 'stat' # Done

end
