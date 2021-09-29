app = {};
local a = 1;
function app.init()
	print("app.init");
end;
function app.build()
	return Scaffold:new({
		appBar = AppBar:new({
			title = Text:new("标题", {
				style = {
					fontSize = sp(40),
					color = Color("#ffffff"),
					fontWeight = FontWeight.w400
				}
			})
		}),
		body = Container:new({
			padding = EdgeInsets.all(sp(30)),
			margin = EdgeInsets.only({
				top = 10,
				left = 10,
				bottom = 10,
				right = 10
			}),
			child = CommonStatefulWidget:new({
				widgetName = "my_stateful_widget",
				path = "assets/lua/component/my_stateful_widget.lua"
			}),
			decoration = BoxDecoration:new({
				borderRadius = BorderRadius.all(sp(40)),
				border = Border.all({
					width = 5,
					color = Color("#000000")
				}),
				color = Color("#ffffff")
			})
		})
	});
end;
return app;
