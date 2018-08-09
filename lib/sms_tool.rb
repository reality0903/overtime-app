module SmsTool
	account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']

  # instaties rest client and stores the account_sid and auth_token variables inside of it
  @client = Twilio::REST::Client.new account_sid, auth_token

  # shorthand notation for def self.send_sms(number: number, message: message)
	def self.send_sms(number:, message:)
		@client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: "+1#{number}",
      body: "#{message}"
    )
	end
end
