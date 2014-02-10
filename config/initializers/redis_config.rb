require "redis/distributed"

settings = RedisNodeView::Settings.new
hosts_with_ports = settings.ports.collect { |port|
    "redis://#{ settings.host }:#{ port }"
}

$distributed_redis = Redis::Distributed.new(hosts_with_ports, :driver => :hiredis)