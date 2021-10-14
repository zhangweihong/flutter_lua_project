my_stateless_widget = {};
function my_stateless_widget.init()--初始化
	print("my_stateless_widget init");
end;
function my_stateless_widget.build()
	
	return Container:new({
		child = Text:new("my_stateless_widget", {
			style = {
				fontSize = sp(50),
				fontWeight = FontWeight.w400
			}
		})
	});
end;
return my_stateless_widget;
