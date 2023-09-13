require 'sidekiq-scheduler'

Sidekiq::Cron::Job.create(
  name: 'EventNotificationWorkerJob',
  cron: '* * * * * Asia/Kathmandu', # Every minute
  class: 'EventNotificationWorkerJob'
)
