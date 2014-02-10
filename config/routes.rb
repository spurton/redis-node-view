RedisNodeView::Engine.routes.draw do
  resources :nodes do
    get :search, on: :collection
  end

  root to: "nodes#index"
end
