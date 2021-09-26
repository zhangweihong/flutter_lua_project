app = {};
local a = 1;
function app.init()
	print("app.init");
end;
function app.build()
	return Scaffold:new({
		body = GestureDetector:new({
			child = Align:new({
				alignment = Alignment.center,
				child = Text:new("数字" .. a, {
					style = {
						fontSize = sp(50),
						fontWeight = FontWeight.bold
					}
				})
			})
		})
	});
end;
return app;
