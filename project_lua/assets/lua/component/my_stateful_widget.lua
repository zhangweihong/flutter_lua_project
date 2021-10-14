my_stateful_widget = {};
function my_stateful_widget.initState()--state 初始化
	print("my_stateful_widget init");
end;
function my_stateful_widget.build()
	Align:new(
		child = ,
		alignment =
	)

	return Container:new({
		child = GestureDetector:new({
			child = Text:new("my_stateful_widget", {
				style = {
					fontSize = sp(50),
					fontWeight = FontWeight.w400
				}
			}),
			onTap = function()
				my_stateful_widget.setState({
					callback = function()
						print("my_stateful_widget");
					end
				});
			end
		})
	});
end;
return my_stateful_widget;
