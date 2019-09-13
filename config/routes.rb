BlogBoi::Engine.routes.draw do
  root to: "articles#index" 
  
  resources :articles, path: '/' do
  	resources :comments
  end

  get '/category/:category_name', to: 'articles#category_index'
end
