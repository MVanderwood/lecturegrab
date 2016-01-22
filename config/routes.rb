Rails.application.routes.draw do
  get 'options/show'

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
  post '/subjects/:id/' => 'subjects#follow'

  get '/discussions' => 'discussions#index'
  get '/discussions/new' => 'discussions#new'
  get '/discussions/:id' => 'discussions#show'
  get '/discussions/:id/edit' => 'discussions#edit'
  post '/discussions/create' => 'discussions#create'
  patch '/discussions/:id' => 'discussions#update'
  delete '/discussions/:id' => 'discussions#destroy'

  get '/users/:handle/queue' => 'queues#show'
  get '/users/:handle/options' => 'options#show'

  namespace :api do
    get '/lectures/:id/tags' => 'tags#index_lecture_tag'
    post '/lectures/:id/tags/create' => 'tags#create_lecture_tag'
    patch '/lectures/:id/tags/:tag_id' => 'tags#confirm_lecture_tag'
    delete '/lectures/:id/tags/:tag_id' => 'tags#destroy_lecture_tag'

    get '/discussions/:id/posts' => 'posts#index'
    post '/discussions/:id/posts/create' => 'posts#create'
    patch '/discussions/:id/posts/:post_id' => 'posts#update'
    delete '/discussions/:id/posts/:post_id' => 'posts#destroy'

    get '/users/:handle/options' => 'options#show'
    post '/users/:handle/options/create' => 'options#create'
    patch '/users/:handle/options/:option_id' => 'options#update'
    delete '/users/:handle/options/:option_id' => 'options#destroy'
  end

  devise_for :users
end