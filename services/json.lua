JSON = require("dkjson")
LFS = require("lfs")

Service = {}

function Service.getFileJson(pathToFile)

	local file = assert(io.open(pathToFile,"r"));

	local fileData = file:read "*a"

	file:close()

	local res, pos, err = JSON.decode(fileData, 1, nil)

	return res

end

function Service.parseJson(json)

	local decoded, pos, err = JSON.decode(json, 1, nil)

	return decoded

end


return Service
