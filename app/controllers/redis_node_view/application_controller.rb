require 'will_paginate/array'

module RedisNodeView
  class ApplicationController < ActionController::Base
    protect_from_forgery
    before_filter :auth

    private

    def auth
      if ENV["REDIS_NODE_VIEW_HTTP_BASIC_AUTH_USER"] && ENV["REDIS_NODE_VIEW_HTTP_BASIC_AUTH_PASSWORD"]
        authenticate_or_request_with_http_basic {|u, p| u == ENV["REDIS_NODE_VIEW_HTTP_BASIC_AUTH_USER"] && p == ENV["REDIS_NODE_VIEW_HTTP_BASIC_AUTH_PASSWORD"] }
      end
    end

  end
end
