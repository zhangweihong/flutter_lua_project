my_stateless_widget = {};
function my_stateless_widget.init()--初始化
	print("my_stateless_widget init");
end;
function my_stateless_widget.build()
	
	return Container:new({
		width = sp(300),
		height = sp(100),
		decoration = BoxDecoration:new({
			color = Color("#f00"),
		}),
		child = Stack:new({
			children = {
				Positioned:new({
					child = Container:new({
						child = Text:new("my_stateless_widget Stack 2", {
							style = {
								fontSize = sp(10),
								fontWeight = FontWeight.w400
							}
						}),
					}),
					left = 100,
					top = 5
				}),
				Text:new("my_stateless_widget Stack 1", {
					style = {
						fontSize = sp(10),
						fontWeight = FontWeight.w400
					}
				})
			},
			fit = StackFit.expand,
			alignment = Alignment.topRight
		})
		
	});
end;
return my_stateless_widget;
