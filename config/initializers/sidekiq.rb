# frozen_string_literal: true

redis_conn = proc {
  Redis.new(
    url: 'redis://localhost:6379/0',
    id: "UNDP-PID-#{::Process.pid}"
  )
}

Sidekiq.configure_server do |config|
  config.redis = ConnectionPool.new(size: 25, &redis_conn)
  config.error_handlers << proc { |ex, ctx_hash| Rails.logger.debug ex, ctx_hash }
end

Sidekiq.configure_client do |config|
  config.redis = ConnectionPool.new(size: 5, &redis_conn)
end
