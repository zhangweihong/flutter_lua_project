app = {};
require("assets/lua/dkjson.lua")--加载json库
local a = 1;
function app.init()
	print("app.init");
	asyncFun({
		task = function ()
			print("asyncFun")
			print(os.time())
		end,
		callback = function ()
			print("asyncFun callback")
			print(os.time())
		end
	})
	readFile({
		path = "D:\\Download\\2434.wb",
		callback = function (exists,value)
			print(exists,value)
		end
	})
	saveFile({
		path = "D:\\Download\\2345.wb",
		content = "我是2345",
		callback = function (flag,reason)
			print(flag,reason)
		end
	})
	delayFun({
		task = function ()
			print("_delayFun")
			print(os.time())
		end,
		time = 1500,
		callback = function ()
			print("_delayFun callback")
			print(os.time())
			print(a)

		end
	})
	debugPrint("DKJson",DKJson.encode({aa = 1}))
end
local pageController = PageController({
	initialPage = 0,
	keepPage = true,
	viewportFraction = 1
})
function app.build(ctx)
	return Scaffold:new({
		appBar = AppBar:new({
			title = Text:new("标题", {
				style = {
					fontSize = sp(20),
					color = Color("#ffffff"),
					fontWeight = FontWeight.w400
				}
			}),
			actions = {
				InkWell:new({
					child = Text:new("btn1",{
						textAlign = TextAlign.left,
						style = {
							fontSize = sp(20),
							fontWeight = FontWeight.w400,
							color = Color('#fff')
						}
					}),
					onTap = function ()
						print("ontap")
					end,
					onDoubleTap = function ()
						print("onDoubleTap")
					end
				})
			}
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
					-- IconButton:new({
					-- 	icon = Icon:new(Icons.ac_unit, {
					-- 		color = Color("#0000ff")
					-- 	}),
					-- 	iconSize = sp(20),
					-- 	onPressed = function()
					-- 		print("IconButton");
					-- 	end
					-- }),
					ElevatedButton:new({
						child = Text:new("ElevatedButton", {
							style = {
								fontSize = sp(10),
								fontWeight = FontWeight.w400
							}
						}),
						onPressed = function()
							print("ElevatedButton onPressed");
							navPush({
								ctx = ctx,
								widget = CommonStatelessWidget:new({
									widgetName = "test_page1",
									path = "assets/lua/page/test_page1.lua"
								})
							})
						end,
						onLongPress = function()
							print("ElevatedButton onLongPress");
						end
					}),
					-- ClipRRect:new({
					-- 	child = Image.asset("assets/img/R-C.jfif",{
					-- 		width = sp(320),
					-- 		height = sp(60),
					-- 		fit = BoxFit.contain
					-- 	}),
					-- 	borderRadius = BorderRadius.all(20)
					-- }),
					ClipRRect:new({
						child = Container:new({
							color = Color('#f00'),
							width = 80,
							height = 80
						}),
						borderRadius = BorderRadius.all(20)
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
	})
end
return app
