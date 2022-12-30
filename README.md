# Flutter SDK version
     flutter_windows_3.0.2-stable

# flutter_lua_project

# 使用Lua代码来进行hotfix代码
正在持续更新中

---------

## 1.编辑器
**使用VSCode进行开发，因为进行了一些简单的代码补全联想设置 在 complete.code-snippets 文件中**

**推荐这三个插件**

![微信截图_20210926145031](https://user-images.githubusercontent.com/6658343/134796976-fe062b4e-3ca4-4db2-bf19-a4135ad7b464.png)

## 2.LuaDardo 和 flutter_lua_dardo 
 **集成的 @arcticfox1919 的两个开源代码，在此基础上修改和增加一些功能。**
  
  **project_lua为工程目录，LuaDardo和flutter_lua_dardo 为库文件**
  **project_lua中的pubspec.yaml的文件中已进行配置**
  ```
  flutter_lua_dardo:
    path: ../flutter_lua_dardo
  ```
  
  ### 1.LuaDardo
  ***为dart和lua的交互库***
  ### 2.flutter_lua_dardo
  ***为flutter的一些内置方法和组件使用lua的形式书写出来***
  ### 3.project_lua
  ***为工作空间，使用lua进行全局的项目开发，逐步完善中...***
  ##### 1. assets/lua/app.lua 是一个主入口
  ```
  app = {};
  local a = 1;
  function app.init()
  print("app.init");
  end;
  function app.build()
  return Scaffold:new({
    appBar = AppBar:new({
      title = Text:new("标题", {
        style = {
          fontSize = sp(40),
          color = Color("#ffffff"),
          fontWeight = FontWeight.w400
        }
      })
    }),
    body = Container:new({
      height = sp(350),
      padding = EdgeInsets.all(sp(30)),
      margin = EdgeInsets.only({
        top = 10,
        left = 10,
        bottom = 10,
        right = 10
      }),
      child = Column:new({
        children = {
          CommonStatefulWidget:new({
            widgetName = "my_stateful_widget", --组件中的lua的对象实例
            path = "assets/lua/component/my_stateful_widget.lua" --组件的lua文件
          }),
          CommonStatelessWidget:new({
            widgetName = "my_stateless_widget", --组件中的lua的对象实例
            path = "assets/lua/component/my_stateless_widget.lua" --组件的lua文件
          })
        }
      }),
      decoration = BoxDecoration:new({
        borderRadius = BorderRadius.all(sp(40)),
        border = Border.all({
          width = 5,
          color = Color("#000000")
        }),
        color = Color("#ffffff")
      })
    })
  });
  end;
  return app;
  ```



  
