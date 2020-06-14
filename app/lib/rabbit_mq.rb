module RabbitMq
  extend self

  def connection
    @connection ||= Bunny.new.start
  end

  def channel
    Thread.current[:rabbitmq_channel] ||= connection.create_channel
  end

  def queue(name, opts = {})
    channel.queue(name, opts)
  end
end
