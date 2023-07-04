require 'consumer'

class ConsumerJob < ApplicationJob
  queue_as :default
  retry_on Bunny::TCPConnectionFailedForAllHosts, wait: 5.seconds, attempts: 20

  def perform
    Consumer.call
  end
end