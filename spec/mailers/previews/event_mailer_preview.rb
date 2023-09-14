# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/event_mailer/notify_presenter
  def notify_presenter
    presenter = Participant.last
    event = Event.last
    EventMailer.notify_presenter(presenter, event)
  end

  def remind_presenter
    @event = Event.last
    @presenter = @event.participants.where(presenter: true).first
    puts @presenter.inspect

    EventMailer.remind_presenter(@event)
  end
end
