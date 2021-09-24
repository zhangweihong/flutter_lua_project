function app()
	return Text:new("d", {});
end;
require("assets/lua/dkjson.lua");
local a = {
	b = "123",
	c = "456",
	e = -789,
	d = "张三"
};
local js = DKJson.encode(a);
debugPrint(js);

local _decode = DKJson.decode(js);
debugPrint(_decode.b);


debugPrint("hello world");
