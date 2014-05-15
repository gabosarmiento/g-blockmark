GBlockmark::Application.routes.draw do
  use_link_thumbnailer
  post :incoming, to: 'incoming#create'
  devise_for :users
 resources :categories do 
  resources :bookmarks
 end
  get "home" => 'welcome#index'
  root to: 'welcome#index'
end
