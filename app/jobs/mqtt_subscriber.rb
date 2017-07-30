class MQTTSubscriber
  def run
    Thread.new do
      MQTT::Client.connect(host: '34.230.153.145',
                           port: 1883,
                           username: 'peakshaving',
                           password: 'peakshaving') do |c|
        c.get('#') do |topic,message|
          puts "#{topic}: #{message}"
          #Do things, access activerecord etc.
          # Update the meter value in redis
          # Figure out the peak shaving plan that the current meter belongs to
          # Acquire the list of all meters under that Plan
          # Sum all the meter consumption values by iterating through redis.

          #mqtt message format: D2C topic will be 'user_id/D2C
          # =>                  C2D topic will be user_id/C2D

          # Redis key format: user_id/meter_id

        end
      end
    end
  end

  def get_meter_parent_plan

  end
end
