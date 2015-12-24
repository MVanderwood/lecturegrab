Rails.application.routes.draw do
  # get '/' => 'homepages#index'

  get '/' => 'lectures#index'

  get '/lectures' => 'lectures#index'
  get '/lectures/new' => 'lectures#new'
  get '/lectures/:id' => 'lectures#show'
  get '/lectures/:id/edit' => 'lectures#edit'
  post '/lectures/create' => 'lectures#create'
  patch '/lectures/:id' => 'lectures#update'
  delete '/lectures/:id' => 'lectures#destroy'

  get '/lectures/:id/tags/new' => 'tags#new_lecture_tag'
  post '/lectures/:id/tags/create' => 'tags#create_lecture_tag'

  devise_for :users
end