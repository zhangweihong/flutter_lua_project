test_drop_down = {};
function test_drop_down.initState(_state, _tickerProvider, _data)
end;
test_drop_down.selectIndex = 0
function test_drop_down.build(ctx)
	return Scaffold:new({
		body = Container:new({
			child = Center:new({
				child = DropDown:new({
					items = {
						DropdownMenuItem:new({
                            value = 0,
							child = Text:new("11111", {
								textAlign = TextAlign.left,
								style = TextStyle:new({
									fontSize = sp(20),
									fontWeight = FontWeight.w400,
									color = Color("#ff000000")
								})
							})
						}),
						DropdownMenuItem:new({
                            value = 1,
							child = Text:new("22222", {
								textAlign = TextAlign.left,
								style = TextStyle:new({
									fontSize = sp(20),
									fontWeight = FontWeight.w400,
									color = Color("#ff000000")
								})
							})
						}),
						DropdownMenuItem:new({
                            value = 2,
							child = Text:new("3333", {
								textAlign = TextAlign.left,
								style = TextStyle:new({
									fontSize = sp(20),
									fontWeight = FontWeight.w400,
									color = Color("#ff000000")
								})
							})
						}),
						DropdownMenuItem:new({
                            value = 3,
							child = Text:new("444444", {
								textAlign = TextAlign.left,
								style = TextStyle:new({
									fontSize = sp(20),
									fontWeight = FontWeight.w400,
									color = Color("#ff000000")
								})
							})
						}),
						DropdownMenuItem:new({
                            value = 4,
							child = Text:new("55555", {
								textAlign = TextAlign.left,
								style = TextStyle:new({
									fontSize = sp(20),
									fontWeight = FontWeight.w400,
									color = Color("#ff000000")
								})
							})
						}),
						DropdownMenuItem:new({
                            value = 5,
							child = Text:new("66666", {
								textAlign = TextAlign.left,
								style = TextStyle:new({
									fontSize = sp(20),
									fontWeight = FontWeight.w400,
									color = Color("#ff000000")
								})
							})
						}),
						DropdownMenuItem:new({
                            value = 6,
							child = Text:new("77777", {
								textAlign = TextAlign.left,
								style = TextStyle:new({
									fontSize = sp(20),
									fontWeight = FontWeight.w400,
									color = Color("#ff000000")
								})
							})
						})
					},
					value = test_drop_down.selectIndex,
					onChanged = function(index)
						print(index);
                        test_drop_down.setState({
                            callback = function()
                                test_drop_down.selectIndex = index
                            end
                        })
					end
				})
			})
		}),
		appBar = AppBar:new({})
	});
end;
function test_drop_down.dispose()
end;
return test_drop_down;
