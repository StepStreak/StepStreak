require 'bunny'
require 'json'

class Consumer
  def self.call
    connection = Bunny.new("amqp://guest:guest@localhost:5672")
    connection.start

    channel = connection.create_channel
    queue = channel.queue("activities")

    begin
      puts " [*] Waiting for messages. To exit press CTRL+C"
      queue.subscribe(block: true) do |delivery_info, properties, body|
        # parse the json string into an object
        data = JSON.parse(body, symbolize_names: true)
        puts " [x] Received #{data}"

        Activity.create(data)
      end
    rescue Interrupt => _
      connection.close

      exit(0)
    end
  end
end
