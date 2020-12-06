shared_config = {
  url: ENV["JOB_WORKER_URL"],
  namespace: "sidekiq:abhinavnepal:#{ENV['STAGE'] || 'dev'}"
}

Sidekiq.configure_server do |config|
  config.redis = shared_config
end

Sidekiq.configure_client do |config|
  config.redis = shared_config
end
