Rails.application.routes.draw do
  get '/' => 'homepages#index'

  get '/lectures' => 'lectures#index'
  get '/lectures/new' => 'lectures#new'
  get '/lectures/:id' => 'lectures#show'
  get '/lectures/:id/edit' => 'lectures#edit'
  post '/lectures/create' => 'lectures#create'
  patch '/lectures/:id' => 'lectures#update'
  delete '/lectures/:id' => 'lectures#destroy'

  get '/lectures/:id/tags/new' => 'tags#new_lecture_tag'
  post '/lectures/:id/tags/create' => 'tags#create_lecture_tag'

  get '/subjects' => 'subjects#index'
  get '/subjects/new' => 'subjects#new'
  get '/subjects/:id' => 'subjects#show'
  get '/subjects/:id/edit' => 'subjects#edit'
  post '/subjects/create' => 'subjects#create'
  patch '/subjects/:id' => 'subjects#update'
  delete '/subjects/:id' => 'subjects#destroy'

  get '/discussions' => 'discussions#index'
  get '/discussions/new' => 'discussions#new'
  get '/discussions/:id' => 'discussions#show'
  get '/discussions/:id/edit' => 'discussions#edit'
  post '/discussions/create' => 'discussions#create'
  patch '/discussions/:id' => 'discussions#update'
  delete '/discussions/:id' => 'discussions#destroy'

  devise_for :users
end