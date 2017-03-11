class MonitorsController < ApplicationController
  def index
    @data={}
    redis = Redis::Store::Factory.create('lianjia-redis')
    keys = %w(process:ershoufang process:travel_xiaoqu)
    values = redis.mget(keys)
    keys.each_with_index do |key, index|
      @data[key] = values[index]
    end
  end
end
