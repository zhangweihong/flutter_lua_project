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
					fontSize = sp(20),
					color = Color("#ffffff"),
					fontWeight = FontWeight.w400
				}
			})
		}),
		body = Container:new({
			padding = EdgeInsets.all(sp(10)),
			width = w(750),
			alignment = Alignment.center,
			margin = EdgeInsets.only({
				top = 10,
				left = 10,
				bottom = 10,
				right = 10
			}),
			child = Column:new({
				children = {
					CommonStatefulWidget:new({
						widgetName = "my_stateful_widget",
						path = "assets/lua/component/my_stateful_widget.lua"
					}),
					CommonStatelessWidget:new({
						widgetName = "my_stateless_widget",
						path = "assets/lua/component/my_stateless_widget.lua"
					}),
					Text:new("字体", {
						style = {
							fontSize = sp(30),
							fontWeight = FontWeight.w400
						}
					}),
					-- Container:new({
					-- 	child = InkWell:new({
					-- 		child = Text:new("InkWell", {
					-- 			style = {
					-- 				fontSize = sp(40),
					-- 				fontWeight = FontWeight.w400
					-- 			}
					-- 		}),
					-- 		onTap = function()
					-- 			print("InkWell");
					-- 		end
					-- 	})
					-- }),
					-- Icon:new(Icons.ac_unit, {
					-- 	color = Color("#ff0000")
					-- }),
					IconButton:new({
						icon = Icon:new(Icons.ac_unit, {
							color = Color("#0000ff")
						}),
						iconSize = sp(20),
						onPressed = function()
							print("IconButton");
						end
					}),
					ElevatedButton:new({
						child = Text:new("ElevatedButton", {
							style = {
								fontSize = sp(10),
								fontWeight = FontWeight.w400
							}
						}),
						onPressed = function()
							print("ElevatedButton onPressed");
						end,
						onLongPress = function()
							print("ElevatedButton onLongPress");
						end
					})
				}
			}),
			decoration = BoxDecoration:new({
				borderRadius = BorderRadius.all(sp(10)),
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
