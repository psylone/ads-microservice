module GeocoderService
  module Api
    def geocode_async(city)
      queue.publish(city, persistent: true)
    end
  end
end
