Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  # products
  resources :products do
    resources :reviews
  end
  get "/products/custom/:category" => "products#custom"

  # contents
  resources :contents do
    resources :comments
    member do
      put "like", to: "contents#upvote"
    end
  end
  get "/contents/custom/:category" => "contents#custom"

  # ranking
  get 'ranking/category/:category' => "ranking#category"

  # mypouch
  get 'mypouch/index' => "mypouch#index"
  get 'mypouch/face'=> "mypouch#face"
  get 'mypouch/survey' => "mypouch#survey"
  get 'mypouch/keyword'=> "mypouch#keyword"
  post 'mypouch/result' => "mypouch#result"

  # store
  get 'store/index'
  get 'store/category/:category' => "store#category"

  # mpadmin
  get 'mpadmin/index'
  get 'mpadmin/mpusers'
  get 'mpadmin/mpusershow'
  get 'mpadmin/contents'
  get 'mpadmin/products'

  # tinymce
  post '/tinymce_assets' => 'tinymce_assets#create'


end
