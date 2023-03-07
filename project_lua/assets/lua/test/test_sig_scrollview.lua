test_sig_scrollview = {}
function test_sig_scrollview.init()--初始化操作

end

local function widgets()
    local wds = {}
    for i = 1, 20 do
        local color = Color('#ffffffff')
        if i % 2 == 0 then
            color = Color('#ff9932CC')
        else
            color = Color('#ff32CD32')
        end
        table.insert(wds,Container:new({
            child = Text:new(tostring(i),{
                textAlign = TextAlign.left,
                style = TextStyle:new({
                    fontSize = sp(20),
                    fontWeight = FontWeight.w400,
                    color = Color('#ff000000')
                })
            }),
            width = 100000,
            color = color
            -- margin = ,
            -- padding = ,
            -- decoration = ,
            -- foregroundDecoration = nil,
            -- alignment = nil
        })
        );
    end
    return wds
end

function test_sig_scrollview.build(ctx)--widget的build
    return Scaffold:new({
        body = SingleChildScrollView:new({
            child = Column:new({
                children = widgets(),
                mainAxisAlignment = MainAxisAlignment.start,
                crossAxisAlignment = CrossAxisAlignment.start
            }),
            -- controller = 
        }),
        appBar = AppBar:new({
            -- leading = ,
            -- title = ,
            -- actions = 
        }),
        -- bottomNavigationBar = 
    })
end
return test_sig_scrollview
