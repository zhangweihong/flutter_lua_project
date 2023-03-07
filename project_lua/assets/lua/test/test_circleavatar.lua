test_circleavatar = {}
function test_circleavatar.initState(_state,_tickerProvider,_data)--状态初始化_state是当前widget的状态，_tickerProvider是ticker,_data为lua table传参
    
end

--function test_circleavatar.persistentFrameCallback(time)
--	print('persistentFrameCallback',time)
--end

--function test_circleavatar.postFrameCallback(time)
--	print('postFrameCallback',time)
--end

function test_circleavatar.build(ctx)--进行build操作
    return Scaffold:new({
        body = Container:new({
            width = 200,
            height = 200,
            child = CircleAvatar:new({
                child = ClipRRect:new({
                    clipBehavior = Clip.antiAliasWithSaveLayer,
                    child = Image.network("https://tse2-mm.cn.bing.net/th/id/OIP-C.FwcCcs9QgWK2BDmCLVYjYAHaJQ?pid=ImgDet&rs=1",{
                        width = 100,
                        height = 100,
                        fit = BoxFit.cover,
                    }),
                    borderRadius = BorderRadius.all(50),
                    -- clipBehavior = 
                }),
                backgroundImage = Image.network("https://ts1.cn.mm.bing.net/th/id/R-C.034d131caf0a1ab38d8762e4dde29db3?rik=l6BbajNoBozSBA&riu=http%3a%2f%2fseopic.699pic.com%2fphoto%2f50010%2f6735.jpg_wh1200.jpg&ehk=oPkvwuM7XbwBiJvddmos8WqH46x6GiVMYuTyekgW7Ec%3d&risl=&pid=ImgRaw&r=0",{
                    -- width = ,
                    -- height = ,
                    -- fit = 
                }),
                foregroundImage = nil,
                backgroundColor = nil,
                foregroundColor = nil,
                onChanged = function(value)
                    
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

function test_circleavatar.dispose()--widget 销毁
    
end


return test_circleavatar
