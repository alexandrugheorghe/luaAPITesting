HTTP = require("socket.http")
LTN12 = require("ltn12")
jsonService = require('json')

Service = {}

function Service.getJson(path)

	local res = {}

	req, code, headers = HTTP.request{
		method = "GET",
		url = path,
		headers = {
            ["content-type"] = "text/json"
        },
		sink = LTN12.sink.table(res)
	}

	local resBody = table.concat(res)

	return resBody

end

return Service

