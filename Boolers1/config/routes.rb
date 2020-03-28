Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/' => 'books#root'
  # get 'books' => 'books#index',as:'root'
  resources :books
  root 'books#root'
end
