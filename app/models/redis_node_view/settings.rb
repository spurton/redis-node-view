module RedisNodeView
  class Settings < Settingslogic
    source "#{ RedisNodeView::Engine.root }/config/distributed_redis.yml"
    namespace Rails.env
  end
end