require 'json'

class MQTTSubscriber
  def run
    Thread.new do
      MQTT::Client.connect(host: '34.230.153.145',
                           port: 1883,
                           username: 'peakshaving',
                           password: 'peakshaving') do |c|
        c.get('#') do |topic,message|
          #puts "#{topic}: #{message}"
          $redis.set(topic, message)
          puts $redis.get(topic)
          # Do things, access activerecord etc.
          unless topic == 'test'
            message_hash = JSON.parse(message)
            puts value = message_hash['body']['value']
            meter_id = message_hash['body']['meter_id']
            $redis.set(meter_id, value)
            puts $redis.get(meter_id)
          end
          # Update the meter value in redis
          # Figure out the peak shaving plan that the current meter belongs to
          # Acquire the list of all meters under that Plan
          # Sum all the meter consumption values by iterating through redis.

          #mqtt message format: D2C topic will be 'user_id/gateway_id/northbound
          # =>                  C2D topic will be user_id/gateway_id/southbound

          # Redis key format: meter_id

        end
      end
    end
  end

  def get_meter_parent_plan

  end
end
