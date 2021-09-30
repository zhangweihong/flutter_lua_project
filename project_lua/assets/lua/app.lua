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
			height = sp(350),
			padding = EdgeInsets.all(sp(30)),
			margin = EdgeInsets.only({
				top = 10,
				left = 10,
				bottom = 10,
				right = 10
			}),
			child = Column:new({
				children = {
					CommonStatefulWidget:new({
						widgetName = "my_stateful_widget", --组件中的lua的对象实例
						path = "assets/lua/component/my_stateful_widget.lua" --组件的lua文件
					}),
					CommonStatelessWidget:new({
						widgetName = "my_stateless_widget", --组件中的lua的对象实例
						path = "assets/lua/component/my_stateless_widget.lua" --组件的lua文件
					})
				}
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
