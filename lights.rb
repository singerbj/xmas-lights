require 'milight'

# Initialise a controller
lights = Milight::Controller.new '192.168.2.5'

colorMap = {}
colorMap[0] = '#ff1000'
colorMap[1] = '#00FF00'


lights.group(1).on
lights.group(2).on

while true do
    for i in 1..4
        color = colorMap[rand(0..1)]
            brightness = rand(1..100)
            puts "Light #{i} is color #{color} at brightness #{brightness}"
        for j in 1..10
            lights.group(i).on.hue(color).brightness(brightness)
        end
    end

    puts Time.now
    sleepTime = rand(1..5)
    puts "Sleeping #{sleepTime} second(s)"
    sleep sleepTime
end
