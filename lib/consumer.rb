require 'bunny'
require 'json'

connection = Bunny.new("amqp://guest:guest@localhost:5672")
connection.start

channel = connection.create_channel
queue = channel.queue("activities")

begin
  puts " [*] Waiting for messages. To exit press CTRL+C"
  queue.subscribe(block: true) do |delivery_info, properties, body|
    data = JSON.parse(body)
    puts " [x] Received #{data}"
  end
rescue Interrupt => _
  connection.close

  exit(0)
end
