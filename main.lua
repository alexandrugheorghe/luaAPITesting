httpService = require("services.http")
jsonService = require("services.json")
helpers = require("services.helpers")
config = require("tests.config")

api = jsonService.getFileJson(config.rootPath .. '/endpoints.json')

local baseUrl = api.baseUrl

for index, value in pairs(api.queries) do

	local parsedUrl = baseUrl..value.query

	print('--- Accesing: '..parsedUrl);

	local jsonResponse = httpService.getJson(parsedUrl)

	jsonResponse = helpers.allTrim(jsonResponse)
	value.expectedResponse = helpers.allTrim(value.expectedResponse)

	if value.expectedResponse == jsonResponse then
		print('--- Url:'.. parsedUrl .. ' ...OK')
	else
		print('--- Url: '.. parsedUrl .. ' ...FAILED:')
		print('--- Expected: '..value.expectedResponse)
		print('--- Got: '..jsonResponse)
	end

end


