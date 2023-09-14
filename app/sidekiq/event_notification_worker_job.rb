class EventNotificationWorkerJob
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform
    events = Event.where('date = ?', Date.today)

    events.each do |event|
      current_time_minus_30_minutes = Time.now + 30.minutes
      if current_time_minus_30_minutes.strftime('%H:%M') == event.time.strftime('%H:%M')
        EventMailer.remind_presenter(event).deliver_now
      else
        puts "Event not found"
      end
    end
  end
end
