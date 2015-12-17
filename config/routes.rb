Rails.application.routes.draw do
  get '/' => 'homepages#index'

  get '/lectures' => 'lectures#index'

  devise_for :users
end