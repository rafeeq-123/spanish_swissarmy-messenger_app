require 'twilio-ruby'
class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def reply_phrase
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio
    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: from_number,
      body: "#{Message.phrase}"
    )
  end

  def send_phrase
    message_body = params["Body"]
    to_number = params["To"]
    boot_twilio
    @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to:   to_number,
      body: "#{Message.phrase}"
    )
  end

  private

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
