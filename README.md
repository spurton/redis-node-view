Redis Node View
====

This is a web view for Redis::Distributed: Ruby Doc: http://rubydoc.info/gems/redis/2.1.1/Redis/Distributed which is a module included in the Ruby Redis client. Here is more info about it: Sharding Redis Is Easy: http://artemyankov.com/sharding-redis-is-easy/

The web UI allows you to page through each node in the hash ring and get information about the node. As well as the ability to search for a key which will return the node where the key resides as well as storage information about the key.

## Installation

Add this line to your application's Gemfile:

    gem 'redis-node-view'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redis-node-view

## Usage

To use with Rails, the server expects a $distributed_redis global variable to be set.
Here is an example of setting up multiple instances with different ports:

Create an initializer in /initializers/distributed_redis.rb

```ruby
config = YAML.load_file(Rails.root.to_s + '/config/distributed_redis.yml')
hosts_with_ports = config[Rails.env].redis.ports.to_a.collect { |port| "redis://#{ config[Rails.env].redis.host }:#{ port }" }
$distributed_redis = Redis::Distributed.new(hosts_with_ports, :driver => :hiredis)
```

The distributed_redis.yml file looks like:

```yaml
defaults: &defaults
  redis:
    host: 127.0.0.1
    ports: !ruby/range 6400..6410

development:
  <<: *defaults

test:
  <<: *defaults

staging:
  <<: *defaults

production:
  <<: *defaults
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request