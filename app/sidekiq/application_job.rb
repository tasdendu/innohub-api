# frozen_string_literal: true

class ApplicationJob
  include Sidekiq::Job
  include Rails.application.routes.url_helpers

  sidekiq_options(
    queue: 'undp',
    retry_queue: 'undp',
    retry: 2,
    backtrace: 50
  )
end
