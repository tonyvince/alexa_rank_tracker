module Recurring
  class MyTask
    include Delayed::RecurringJob
    run_every 1.day
    run_at '12:02pm'
    timezone 'UTC'
    queue 'slow-jobs'
    def perform
      puts "hello"
    end
  end
end