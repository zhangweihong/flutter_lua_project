test_datatable = {}
function test_datatable.initState(_state,_tickerProvider,_data)--状态初始化_state是当前widget的状态，_tickerProvider是ticker,_data为lua table传参
    
end

--function test_datatable.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_datatable.postFrameCallback(time)
--	print('postFrameCallback',time)
--end
local selectArry = {false,false}
function test_datatable.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            child = DataTable:new({
                columns = {
                    DataColumn:new({
                        label = Text:new("name",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),--widget 类型
                        tooltip = "姓名",
                        onSort = function(index,select)
                            
                        end
                    }),
                    DataColumn:new({
                        label = Text:new("date",{
                            textAlign = TextAlign.left,
                            style = TextStyle:new({
                                fontSize = sp(20),
                                fontWeight = FontWeight.w400,
                                color = Color('#ff000000')
                            })
                        }),--widget 类型
                        tooltip = "日期",
                        onSort = function(index,select)
                            
                        end
                    })
                },
                rows = {
                    DataRow:new({
                        cells = {
                            DataCell:new({
                                child = Text:new("张三",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#ff000000')
                                    })
                                }),--widget 类型
                                placeholder = false,
                                showEditIcon = false,
                                onTap = function()
                                    
                                end,
                                onLongPress = function()
                                    
                                end
                            }),
                            DataCell:new({
                                child = Text:new("2023-3-7",{
                                    textAlign = TextAlign.left, 
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#ff000000')
                                    })
                                }),--widget 类型
                                placeholder = false,
                                showEditIcon = false,
                                onTap = function()
                                    
                                end,
                                onLongPress = function()
                                    
                                end
                            })
                        },--datacell 类型
                        selected = selectArry[1],
                        onSelectChanged = function(value)
                            selectArry[1] = value
                            test_datatable.setState({
                                callback = function()
                                
                                end
                            })
                            print("onSelectChanged",value)
                        end,
                        onLongPress = function()
                            
                        end
                    }),
                    DataRow:new({
                        cells = {
                            DataCell:new({
                                child = Text:new("李四",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#ff000000')
                                    })
                                }),--widget 类型
                                placeholder = false,
                                showEditIcon = false,
                                onTap = function()
                                    
                                end,
                                onLongPress = function()
                                    
                                end
                            }),
                            DataCell:new({
                                child = Text:new("2023-3-7",{
                                    textAlign = TextAlign.left,
                                    style = TextStyle:new({
                                        fontSize = sp(20),
                                        fontWeight = FontWeight.w400,
                                        color = Color('#ff000000')
                                    })
                                }),--widget 类型
                                placeholder = false,
                                showEditIcon = false,
                                onTap = function()
                                    
                                end,
                                onLongPress = function()
                                    
                                end
                            })
                        },--datacell 类型
                        selected = selectArry[2],
                        onSelectChanged = function(value)
                            selectArry[2] = value
                            test_datatable.setState({
                                callback = function()
                                
                                end
                            })
                            print("onSelectChanged",value)
                        end,
                        onLongPress = function()
                            
                        end
                    })
                },
                sortColumnIndex = nil,
                dividerThickness = 2,
                onSelectAll = function(value)
                    selectArry[1] = value
                    selectArry[2] = value
                    test_datatable.setState({
                        callback = function()
                        
                        end
                    })
                    print("onSelectAll",value)
                end
            }),
            -- margin = ,
            -- padding = ,
            -- decoration = ,
            -- foregroundDecoration = nil,
            -- alignment = nil
        }),
        appBar = AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        }),
        -- bottomNavigationBar = 
    })--返回widget
end

function test_datatable.dispose()--widget 销毁
    
end


return test_datatable
