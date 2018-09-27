-- just2fat4ya installation script
--
--

fs.makeDir("data")
fs.makeDir("programs")
local programTable = {"https://raw.githubusercontent.com/BryonOlfert/CC-frameShip/master/programs/move.lua",
"https://raw.githubusercontent.com/BryonOlfert/CC-frameShip/master/programs/requestTarget.lua",
"https://raw.githubusercontent.com/BryonOlfert/CC-frameShip/master/programs/travel.lua"
}

for i = 1, #programTable do
	lib = http.get(programTable[i])
	libfile = lib.readAll()
	local file1 = fs.open("programs/"..programTable[i], "w")
	file1.write(libFile)
	file1.close()
i = i + 1
end

startup = http.get("https://raw.githubusercontent.com/BryonOlfert/CC-frameShip/master/startup")
startupFile = startup.readAll()
local file2 = fs.open("startup", "w")
file2.write(startupFile)
file2.close()
fs.delete("instal.lua")