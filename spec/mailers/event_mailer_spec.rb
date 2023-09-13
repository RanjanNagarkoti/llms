require "rails_helper"

RSpec.describe EventMailer, type: :mailer do
  describe "notify_presenter" do
    let(:mail) { EventMailer.notify_presenter }

    it "renders the headers" do
      expect(mail.subject).to eq("Notify presenter")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
