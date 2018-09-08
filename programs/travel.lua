local x, y, z = gps.locate() -- gets frameships position from gps Server
local direction = "string" -- creates variable to hold the move direction for the carriage controler

if y < 130 then  -- This will cause a frameship to move to a constant 
    peripheral.call("back","move",direction,false,false)
else
    cfile = fs.open("data/task.lua","w") -- after the travel height is met, the computers task will be changed to standard movement.
    cfile.write("move.lua")
    cfile.close()
end