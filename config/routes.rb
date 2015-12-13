Rails.application.routes.draw do
  get '/' => 'homepages#index'


  devise_for :users
end