my_stateless_widget = {};
function my_stateless_widget.init()
	print("my_stateless_widget init");
end;
function my_stateless_widget.build()
	return Text:new("my_stateless_widget", {
		style = {
			fontSize = sp(100),
			fontWeight = FontWeight.w400
		}
	});
end;
return my_stateless_widget;
