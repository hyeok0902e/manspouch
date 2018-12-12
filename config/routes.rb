Rails.application.routes.draw do
  root 'home#index'

  # scaffold
  resources :products
  resources :contents

  # ranking
  get 'ranking/index'
  get 'ranking/category'

  # mypouch
  get 'mypouch/index'
  get 'mypouch/face'
  get 'mypouch/survey'
  get 'mypouch/keyword'
  get 'mypouch/result'

  # mpadmin
  get 'mpadmin/index'
  get 'mpadmin/mpusers'
  get 'mpadmin/mpusershow'
  get 'mpadmin/contents'
  get 'mpadmin/products'
end
