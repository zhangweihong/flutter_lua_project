app = {};
local a = 1;
function app.init()
	print("app.init");
end;

function app.build()
	return Scaffold:new({
		appBar = AppBar:new({ 
			title = Text:new('标题',{
				style={
					fontSize = sp(30),
					color = Color('#ffffffff'),
					fontWeight = FontWeight.w400
				} 
			}) 
		}),
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
