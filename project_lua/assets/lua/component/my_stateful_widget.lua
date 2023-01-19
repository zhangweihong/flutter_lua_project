my_stateful_widget = {};
local count = 1;
local vb = true;
function my_stateful_widget.initState(_state,_tickerProvider)--state 初始化
	print("my_stateful_widget init");
	print("_state",_state)
	print("_ticker",_tickerProvider)
end;

function my_stateful_widget.build(ctx)
	return Container:new({
		child = Column:new({
			children = {
				GestureDetector:new({
					child = Visibility:new({
						child = Container:new({
							height = sp(50),
							width = sp(200),
							alignment = Alignment.center,
							child = Text:new("my_stateful_widget ".. count, {
								textAlign = TextAlign.center,
								style = TextStyle:new({
									fontSize = sp(20),
									fontWeight = FontWeight.w400,
									color = Color('#fff')
								})
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
						visible = vb
					}),
					onDoubleTap = function()
					--    vb = not vb
					--    my_stateful_widget.setState()
					end,
					onTapDown = function(detail)
						print("detail globalPosition",detail.globalPosition.dx,detail.globalPosition.dy)
						print("detail localPosition",detail.localPosition.dx,detail.localPosition.dy)
					end,
					onTap = function()
						my_stateful_widget.setState({
							callback = function()
								count = count + 1
								print("my_stateful_widget update state");
							end
						});
					end
				})
			},
			mainAxisAlignment = MainAxisAlignment.start,
			crossAxisAlignment = CrossAxisAlignment.start
		})
	});
end;
function my_stateful_widget.didChangeDependencies()
	print("didChangeDependencies")
end

function my_stateful_widget.didUpdateWidget(oldWidget)
	print("didUpdateWidget")
end
return my_stateful_widget;
