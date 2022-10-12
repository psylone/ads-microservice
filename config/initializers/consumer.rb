# channel = RabbitMq.consumer_channel
# exchange = channel.default_exchange
# queue = channel.queue('ads', durable: true)

# queue.subscribe(manual_ack: true) do |delivery_info, properties, payload|
#   payload = JSON(payload)

#   p "!!! payload: #{payload}"

#   result = Ads::UpdateService.call(
#     id: payload['id'],
#     data: payload['coordinates']
#   )

#   p "!!! result: #{result.inspect}"

#   exchange.publish(
#     '',
#     routing_key: properties.reply_to,
#     correlation_id: properties.correlation_id
#   )

#   channel.ack(delivery_info.delivery_tag)
# end
