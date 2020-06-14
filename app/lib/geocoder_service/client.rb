module GeocoderService
  class Client
    extend Dry::Initializer[undefined: false]
    include Api

    option :queue, default: proc { create_queue }

    private

    def create_queue
      RabbitMq.queue('geocoding', durable: true)
    end
  end
end
