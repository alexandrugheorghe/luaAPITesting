LUAUNIT = require("luaunit")
config = require("config")

JSON = (config.rootPath.."/services/json")
HTTP = (config.rootPath.."/service/http")


TestJsonService = {}

	function TestJsonService.TestFileGetContent()
		local result = JSON.getFileContent(config.rootPath .. '/endpoints.json')
		LUAUNIT.assertEquals(type(result),'string')
	end

	function TestJsonService.TestParseJson()
		local json = {type = 'json'}
		LUAUNIT.assertEquals(json,JSON.parseJson('{"type" : "json"}'))
	end

TestHttpService = {}

	function TestHttpService.TestGetJson()

		local url = "http://jsonplaceholder.typicode.com/posts/1"

		local expectedReponse = '{"userId": 1,"id":1,"title":"sunt aut facere repellat provident occaecati excepturi optio reprehenderit","body":"quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"}'

		LUAUNIT.assertEquals(expectedReponse, HTTP.getJson(url))

	end

