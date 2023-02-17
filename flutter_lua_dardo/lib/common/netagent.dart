import 'package:dio/dio.dart';
import 'package:flutter_lua_dardo/flutter_widget/parameter_exception.dart';
import 'package:flutter_lua_dardo/flutter_widget/responsetype.dart';
import 'package:flutter_lua_dardo/index.dart';

class NetAgent {
  Dio Do;

  NetAgent() {
    var options = BaseOptions(
      connectTimeout: 15000,
      receiveTimeout: 15000,
    );
    Do = Dio(options);
    Do.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onError: (error, handler) {
      return handler.next(error);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }));
  }

  static NetAgent _agent;
  static NetAgent get I {
    if (_agent == null) {
      _agent = NetAgent();
    }
    return _agent;
  }

  Future<Response> fetch(String url, String method,
      {dynamic params,
      String host,
      dynamic header,
      dynamic formData,
      String contentType = "application/json",
      ResponseType responseType = ResponseType.json}) async {
    if (url == null) {
      throw ParameterError(
        name: "fetch",
        type: "",
        expected: "fetch url null",
        source: "",
      );
    }
    if (host != null && url.indexOf("http") != 0) {
      url = host + url;
    }

    try {
      Response res = await _agent.Do.request(url,
          data: formData,
          queryParameters: params,
          options: Options(
              method: method,
              contentType: contentType,
              headers: header,
              responseType: responseType));

      return res;
    } on DioError catch (e) {
      throw e;
    }
  }
}

class FlutterNetAgent {
  static int SetOptions(LuaState ls) {
    var fieldType = ls.getField(-1, "connectTimeout");
    int connectTimeout = 15000;
    if (fieldType == LuaType.luaNumber) {
      connectTimeout = ls.toIntegerX(-1);
    }
    ls.pop(1);

    int receiveTimeout = 15000;
    fieldType = ls.getField(-1, "receiveTimeout");
    if (fieldType == LuaType.luaNumber) {
      receiveTimeout = ls.toIntegerX(-1);
    }
    ls.pop(1);

    int sendTimeout = 60000 * 2;
    fieldType = ls.getField(-1, "sendTimeout");
    if (fieldType == LuaType.luaNumber) {
      sendTimeout = ls.toIntegerX(-1);
    }
    ls.pop(1);

    int maxRedirects;
    fieldType = ls.getField(-1, "maxRedirects");
    if (fieldType == LuaType.luaNumber) {
      maxRedirects = ls.toIntegerX(-1);
    }
    ls.pop(1);

    String baseUrl = '';
    fieldType = ls.getField(-1, "baseUrl");
    if (fieldType == LuaType.luaString) {
      baseUrl = ls.toStr(-1);
    }
    ls.pop(1);

    bool receiveDataWhenStatusError = true;
    fieldType = ls.getField(-1, "receiveDataWhenStatusError");
    if (fieldType == LuaType.luaBoolean) {
      receiveDataWhenStatusError = ls.toBoolean(-1);
    }
    ls.pop(1);

    bool followRedirects = true;
    fieldType = ls.getField(-1, "followRedirects");
    if (fieldType == LuaType.luaBoolean) {
      followRedirects = ls.toBoolean(-1);
    }
    ls.pop(1);

    NetAgent.I.Do.options = BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      baseUrl: baseUrl,
      sendTimeout: sendTimeout,
      receiveDataWhenStatusError: receiveDataWhenStatusError,
      followRedirects: followRedirects,
      maxRedirects: maxRedirects,
    );
    return 0;
  }

  static int Fetch(LuaState ls) {
    var fieldType = ls.getField(-1, "url");
    var url;
    if (fieldType == LuaType.luaString) {
      url = ls.toStr(-1);
    } else {
      throw ParameterError(
        name: "",
        type: "",
        expected: "fetch url null",
        source: "",
      );
    }
    ls.pop(1);

    var method;
    fieldType = ls.getField(-1, "method");
    if (fieldType == LuaType.luaString) {
      method = ls.toStr(-1);
    } else {
      throw ParameterError(
        name: "",
        type: "",
        expected: "fetch method null",
        source: "",
      );
    }
    ls.pop(1);

    var host;
    fieldType = ls.getField(-1, "host");
    if (fieldType == LuaType.luaString) {
      host = ls.toStr(-1);
    }
    ls.pop(1);

    var params;
    fieldType = ls.getField(-1, "params");
    if (fieldType == LuaType.luaTable) {
      LuaTable tb = ls.toPointer(-1) as LuaTable;
      params = tb.map;
    }
    ls.pop(1);

    var header;
    fieldType = ls.getField(-1, "header");
    if (fieldType == LuaType.luaTable) {
      LuaTable tb = ls.toPointer(-1) as LuaTable;
      header = tb.map;
    }
    ls.pop(1);

    var formData;
    fieldType = ls.getField(-1, "formData");
    if (fieldType == LuaType.luaTable) {
      LuaTable tb = ls.toPointer(-1) as LuaTable;
      formData = tb.map;
    }
    ls.pop(1);

    var contentType = "application/json";
    fieldType = ls.getField(-1, "contentType");
    if (fieldType == LuaType.luaString) {
      contentType = ls.toStr(-1);
    }
    ls.pop(1);

    var responseType = ResponseType.json;
    fieldType = ls.getField(-1, "responseType");
    if (fieldType == LuaType.luaNumber) {
      responseType = FlutterResponseType.get(ls.toIntegerX(-1));
    }
    ls.pop(1);

    int callbackId = -1;
    fieldType = ls.getField(-1, "callback");
    if (fieldType == LuaType.luaFunction) {
      callbackId = ls.ref(lua_registryindex);
    } else {
      ls.pop(1);
    }

    NetAgent.I
        .fetch(
      url,
      method,
      host: host,
      params: params,
      header: header,
      formData: formData,
      contentType: contentType,
      responseType: responseType,
    )
        .then((res) {
      if (callbackId != -1) {
        ls.rawGetI(lua_registryindex, callbackId);
        LuaTable tb = LuaTable(0, 3);
        tb.put("statusCode", res.statusCode);
        tb.put("data", res.data);
        tb.put("statusMessage", res.statusMessage);
        ls.pushLuaTable(tb);
        ls.pCall(1, 0, 1);
      }
    });
    return 1;
  }

  static const Map<String, DartFunction> _NetAgentWrap = {
    "SetOptions": SetOptions,
    "Fetch": Fetch,
  };

  static const Map<String, DartFunction> _NetAgentMembers = {"id": null};

  static int _openNetAgentLib(LuaState ls) {
    ls.newMetatable("NetAgentClass");
    ls.pushValue(-1);
    ls.setField(-2, "__index");
    ls.setFuncs(_NetAgentMembers, 0);
    ls.newLib(_NetAgentWrap);
    return 1;
  }

  static void require(LuaState ls) {
    ls.requireF("NetAgent", _openNetAgentLib, true);
    ls.pop(1);
  }
}
