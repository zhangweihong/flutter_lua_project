app = {};
require("assets/lua/dkjson.lua")--加载json库
local a = 1;
function app.init()
	print("app.init");
	asyncFun({
		task = function ()
			print("asyncFun start",os.time())
		end,
		callback = function ()
			print("asyncFun callback",os.time())
		end
	})
	-- readFile({
	-- 	path = "D:\\Download\\2434.wb",
	-- 	async = false,
	-- 	callback = function (exists,value)
	-- 		print("readFile",exists,value)
	-- 	end
	-- })
	-- existsFile({
	-- 	path = "D:\\Download\\2434.wb",
	-- 	async = false,
	-- 	callback = function(exists)
	-- 		print("existsFile",exists)
	-- 	end
	-- })
	-- saveFile({
	-- 	path = "D:\\Download\\2345.wb",
	-- 	async = false,
	-- 	content = "我是2345",
	-- 	callback = function (flag,msg)
	-- 		print("saveFile",flag,msg)
	-- 	end
	-- })
	print("_delayFun start",os.time())
	delayFun({
		task = function ()
			print("_delayFun task start",os.time())
		end,
		time = 2500,
		callback = function ()
			print("_delayFun task finish",os.time(),a)

		end
	})
	debugPrint("DKJson",DKJson.encode({aa = 1}))
end

function app.build(ctx)
	return Scaffold:new({
		appBar = AppBar:new({
			title = Text:new("标题", {
				style = TextStyle:new({
					fontSize = sp(20),
					color = Color("#ffffff"),
					fontWeight = FontWeight.w400
				})
			}),
			actions = {
				InkWell:new({
					child = Text:new("btn1",{
						textAlign = TextAlign.left,
						style = TextStyle:new({
							fontSize = sp(20),
							fontWeight = FontWeight.w400,
							color = Color('#fff')
						})
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
					Center:new({
						child = CommonStatefulWidget:new({
							widgetName = "my_stateful_widget",
							path = "assets/lua/component/my_stateful_widget.lua"
						}),
						-- widthFactor = 3,
						-- heightFactor = 
					}),
					Align:new({
						child = CommonStatelessWidget:new({
							widgetName = "my_stateless_widget",
							path = "assets/lua/component/my_stateless_widget.lua"
						}),
						alignment = Alignment.centerLeft
					}),
					Text:new("字体", {
						style = TextStyle:new({
							fontSize = sp(30),
							fontWeight = FontWeight.w400
						})
					}),
					Text.rich(
						TextSpan:new({
						text = "Rich Text",
						-- children = ,
						-- style = 
					}),{
						style = TextStyle:new({
							color = Color('#ffff0000'),
							-- fontWeight = ,
							fontSize = sp(20)
						}),
						textAlign = TextAlign.center 
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
					Icon:new(Icons.ac_unit, {
						size = sp(10),
						color = Color("#ff0000")
					}),
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
						child = Text:new("Next test_page1", {
							style = TextStyle:new({
								fontSize = sp(10),
								fontWeight = FontWeight.w400
							})
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
						clipBehavior = Clip.antiAlias,
						child = Container:new({
							color = Color('#f00'),
							width = 80,
							height = 80
						}),
						borderRadius = BorderRadius.all(20)
					}),
					ElevatedButton:new({
						child = Image.network("https://ts1.cn.mm.bing.net/th/id/R-C.824b5f6af98d4c0d953eb620fc9fd8fb?rik=bB%2bBx%2fQ5hRfEDA&riu=http%3a%2f%2fpic.weather.com.cn%2fimages%2fcn%2fphoto%2f2020%2f11%2f25%2f20201125142909EB135C7306F256639DAE3032660F23B2.jpg&ehk=XJQ2HWGz25TYiBycQA9TDuPLaB4cUYikEYfTFgIymT8%3d&risl=&pid=ImgRaw&r=0",{
							width = sp(50),
							height = sp(50),
							fit = BoxFit.cover
						}),
						onPressed = function ()
							print("ElevatedButton Image")
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
	})
end
return app
