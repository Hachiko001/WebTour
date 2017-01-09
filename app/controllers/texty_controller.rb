class TextyController < ApplicationController

  def send_text
    @user = current_user
    acctoken_sid= ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new acctoken_sid, auth_token

    @client.messages.create(
      from: '+19089880620',
      to: '+84'+@user.number,
      body: 'Welcome to webtour'
    )
    redirect_to :back
  end
  
end
