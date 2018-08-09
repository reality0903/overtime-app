# Stub module that mimics part of the application
module FakeSms
  # Struct is a data type in Ruby; behaves similiarily to a database or api that can be queried
  Message = Struct.new(:number, :message)
  @messages = []

  def self.send_sms(number:, message:)
    @messages << Message.new(number, message)
  end

  def self.messages
    @messages
  end
end
