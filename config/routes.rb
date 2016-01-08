Rails.application.routes.draw do
  get '/' => 'homepages#index'

  get '/lectures' => 'lectures#index'
  get '/lectures/new' => 'lectures#new'
  get '/lectures/:id' => 'lectures#show'
  get '/lectures/:id/edit' => 'lectures#edit'
  post '/lectures/create' => 'lectures#create'
  patch '/lectures/:id' => 'lectures#update'
  delete '/lectures/:id' => 'lectures#destroy'
  post '/lectures/:id' => 'lectures#text'

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

  get '/users/:handle' => 'users#show'

  namespace :api do
    get 'lectures/:id/tags' => 'tags#index_lecture_tag'
    post '/lectures/:id/tags/create' => 'tags#create_lecture_tag'
    delete '/lectures/:id/tags/:tag_id' => 'tags#destroy_lecture_tag'
    get 'discussions/:id/tags' => 'tags#index_discussion_tag'
    post '/discussions/:id/tags/create' => 'tags#create_discussion_tag'
    delete '/discussions/:id/tags/:tag_id' => 'tags#destroy_discussion_tag'
  end

  devise_for :users
end