Blorgh::Engine.routes.draw do
  root to: "articles#index"
  resources :articles do
    resource :comments
  end
end
