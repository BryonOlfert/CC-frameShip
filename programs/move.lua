local x, y, z = gps.locate() -- gps position from gps server
local cfile = fs.open("data/destination.lua","r") -- gets target destination from 'destination' file
local direction = "string" -- This creates a variable to store direction of travel for carriage controller
local targetCoors = {} -- table for storing destination coordinates
targetCoors = textutils.unserialize(cfile.readAll())
targetCoors[1] = targetCoors[1]+0
targetCoors[2] = targetCoors[2]+0
targetCoors[3] = targetCoors[3]+0
if x ~= targetCoors[1] then
    if x > targetCoors[1] then
        direction = "west"
    else
        direction = "east"
    end
elseif z ~= targetCoors[3] then
    if z > targetCoors[3] then
        direction = "north"
    else
        direction = "south"
    end
elseif y ~= targetCoors[2] then
    if y > targetCoors[2] then
        direction = "down"
    else
        direction = "up"
    end
else
    cfile = fs.open("data/task.lua","w")
    cfile.write("idle.lua")
    cfile.close()
end
peripheral.call("back","move",direction,false,false)