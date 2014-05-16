GBlockmark::Application.routes.draw do
  post :incoming, to: 'incoming#create'
  devise_for :users
 resources :categories do 
  resources :bookmarks, except: [:index] do
    get '/like' => 'votes#like', as: :like
      get '/unlike' => 'votes#unlike', as: :unlike
  end
 end
 get "my_bookmarks" => 'bookmarks#index'
 use_link_thumbnailer
 get "home" => 'welcome#index'
 root to: 'welcome#index'
end
