my_stateful_widget = {};
function my_stateful_widget.initState()--state 初始化
	print("my_stateful_widget init");
end;
function my_stateful_widget.build()
	return Container:new({
		child = GestureDetector:new({
			child = Container:new({
				height = sp(100),
				width = sp(200),
				alignment = Alignment.center,
				child = Text:new("my_stateful_widget", {
					textAlign = TextAlign.center,
					style = {
						fontSize = sp(20),
						fontWeight = FontWeight.w400,
						color = Color('#fff')
					}
				}),
				decoration = BoxDecoration:new({
					color = Color('#9400D3'),
					image = DecorationImage:new({
						image = Image.asset("assets/img/R-C.jfif",{
							width = sp(30),
							height = sp(30),
							fit = BoxFit.cover
						}),
						fit = BoxFit.cover
					})
				})
			}),
			onTap = function()
				my_stateful_widget.setState({
					callback = function()
						print("my_stateful_widget update state");
					end
				});
			end
		})
	});
end;
return my_stateful_widget;
