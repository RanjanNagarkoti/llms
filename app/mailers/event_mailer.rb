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
end
