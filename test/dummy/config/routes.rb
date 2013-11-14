Rails.application.routes.draw do

  mount RedisNodeView::Engine => "/redis_node_view"
end
