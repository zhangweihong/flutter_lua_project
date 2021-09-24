function app()
	return Text:new("d", {});
end
require("assets/lua/dkjson.lua");
local a = {
	b = "123",
	c = "456",
	d = -789,
	e = -789.99,
	f = "张三"
};
local js = DKJson.encode(a);
debugPrint(js);

local _decode = DKJson.decode(js);
debugPrint(_decode.b);
debugPrint(_decode.e);
debugPrint(_decode.f);
debugPrint(type(_decode));
debugPrint(type(_decode.b));
debugPrint(type(_decode.e));


debugPrint("hello world");
})