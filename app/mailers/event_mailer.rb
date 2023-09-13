class EventMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.notify_presenter.subject
  #
  def notify_presenter(presenter, event)
    @user = User.find(presenter.user_id)
    @event = event
    @home_url = ENV['URL']

    @url = "#{@home_url}/events/#{@event.id}"

    mail to: @user.email, subject: 'You\'ve Been Assigned as the Presenter for an Upcoming Event'
  end

  def notify_user(participant, event)
    @user = User.find(participant.user_id)
    @event = event

    mail to: @user.email, subject: 'Thank You for Participating!'
  end

  def remind_presenter(event)
    @event = event
    @presenter = @event.participants.where(presenter: true).first
    @presenter_detail = User.find(@presenter.user_id)

    mail to: @presenter_detail.email, subject: 'You\'re Presenting in 30 Minutes!'
  end
end
