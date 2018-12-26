Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  # check email uniqueness in js whenever keypress
  post "/check_email" => "home#check_email"

  # mypouch
  get 'mypouch/index' => "mypouch#index"
  get 'mypouch/face'=> "mypouch#face"
  post 'mypouch/survey' => "mypouch#survey"
  get 'mypouch/survey' => "mypouch#survey"
  post 'mypouch/keyword'=> "mypouch#keyword"
  get 'mypouch/keyword'=> "mypouch#face"
  post 'mypouch/result' => "mypouch#result"
  get 'mypouch/result' => "home#index"

  # contents
  resources :contents do
    resources :comments
    member do
      put "like", to: "contents#upvote"
    end
  end
  get "/contents/custom/:category" => "contents#custom"
  get "/contents/filter/:filter" => "contents#filter"

  # products
  resources :products do
    resources :reviews
  end
  get "/products/custom/:category" => "products#custom"
  get "/products/filter/:filter" => "products#filter"

  # ranking
  get '/ranking/category/:category' => "ranking#category"

  # store
  get '/store/index'
  get '/store/category/:category' => "store#category"
  get '/store/filter/:filter' => "store#filter"

  # creatures
  resources :creatures do
    resources :talks
    member do
      put "like", to: "creatures#upvote"
    end
  end
  get 'creatures/category/:category' => "creatures#category"

  # Admin
  get 'admin/index' => "admin#index"
  get 'admin/userinfo' => "admin#userinfo"
  get 'admin/contentinfo' => "admin#contentinfo"
  get 'admin/productinfo' => "admin#productinfo"
  get 'admin/creatureinfo' => "admin#creatureinfo"

  # tinymce
  post '/tinymce_assets' => 'tinymce_assets#create'



end
