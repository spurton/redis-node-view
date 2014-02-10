module RedisNodeView
  class NodesController < ApplicationController

    def index
      @nodes = $distributed_redis.nodes.paginate(:page => params[:page], :per_page => 20)
    end

    def show
      @node = $redis_distributed.nodes.detect { |n| Digest::SHA1.hexdigest(n.id) == params[:id] }
      @node_info = @node.info
    end

    def search
      @node = $redis_distributed.node_for(params[:key])
    end
  end
end
