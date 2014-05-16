GBlockmark::Application.routes.draw do
  post :incoming, to: 'incoming#create'
  devise_for :users
 resources :categories do 
  resources :bookmarks
 end
 use_link_thumbnailer
 get "home" => 'welcome#index'
 root to: 'welcome#index'
end
