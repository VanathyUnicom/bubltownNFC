import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../common/app.dart';
import '../common/globel_variables.dart';
import '../models/dio_models.dart';


class DioService {
  get(String url, {bool token = false}) async {
    var dio = Dio();
    printUrlAndHeaderAndBody(url: baseUrl + url, body: {}, header: await getHeader(token), method: "get");
    final res = await dio.get(baseUrl + url,
        options: Options(
          headers: await getHeader(token),
          validateStatus: (status) => true,
        ));
    CommonRestBody body = App.responseMessage(res);
    if (body.error.status == HttpCodeEnum.ok.status.toString()) {
      return res;
    } else {
      return res;
    }
  }

  post(String url, Map data, {bool token = false}) async {
    var dio = Dio();
    printUrlAndHeaderAndBody(url: baseUrl + url, body: {}, header: await getHeader(token), method: "post");
    final res = await dio.post(baseUrl + url,
        data: json.encode(data),
        options: Options(
          headers: await getHeader(token),
          validateStatus: (status) => true,
        ));
    CommonRestBody body = App.responseMessage(res);
    if (body.error.status == HttpCodeEnum.ok.status.toString()) {
      return res;
    } else {
      return res;
    }
  }


  Future<Map<String, dynamic>> getHeader(bool isAuth) async {
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'accept-language': 'en-US',
    };
    if (isAuth) {
      // headers['Authorization'] = getIt<UserProvider>().isAuthorized
      //     ? 'Bearer ${await HiveService.retrieveFromHive(name: 'token', boxName: 'account')}'
      //     : "Bearer " + getIt<UserProvider>().clientToken;

       headers['Authorization'] =
          "Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiNzVlNmQ1MzEtNDcyMC00MGFkLTg1YjMtNTQ2MDE5NTViNGYwIiwiVXNlcklkIjoiNzVlNmQ1MzEtNDcyMC00MGFkLTg1YjMtNTQ2MDE5NTViNGYwIiwiRmlyc3ROYW1lIjoiRGh1dmFuIiwiTGFzdE5hbWUiOiJUZXN0IiwiTG9naW5UeXBlIjoiUGhvbmVudW1iZXIiLCJVc2VyVHlwZSI6IkN1c3RvbWVyIiwiQ2xpZW50SWQiOiJmZTk4MzhiMy1mNmE3LTQ2MTEtZTY0OC0wOGQ4YmVhZTI3MzkiLCJDbGllbnROYW1lIjoiYnVibHRvd25fY3VzdG9tZXJfYXBwX2FsbCIsIkNsaWVudEFwcFR5cGUiOiJNb2JpbGUiLCJMYW5ndWFnZSI6ImVuLUdCIiwiQ2hhbm5lbElkIjoiMjJkZWJmNWMtZGFjYy00ZDY5LWYwYTAtMDhkOGJlYmFmODQ5IiwiQ2hhbm5lbFR5cGUiOiJHcm91cCIsIkNoYW5uZWxOYW1lIjoiRGVtb3Rvd24iLCJQaG9uZW51bWJlciI6Iis5NDc1NzA3MTgxOCIsIlBob25lbnVtYmVyVmVyaWZpZWQiOnRydWUsIkVtYWlsIjoiZGh1dmFuQHRlc3QuY29tIiwiVHdvZmFjdG9yRW5hYmxlZCI6dHJ1ZSwiT3JpZ2luSWQiOiIwYzY1ODg0ZC1jNDBkLTRhZTEtYmQ0Ny01OGExYjRkMzU2MDEiLCJPcmlnaW5OYW1lIjoiYnVibCIsIlRva2VuVHlwZSI6IkxvZ2luVG9rZW4iLCJWMiI6IlRydWUiLCJJc1N1cGVyVXNlciI6dHJ1ZSwiUm9sZSI6Ilt7XCJSb2xlSWRcIjpcIjdlMWFjOTczLWNiNmQtNGQ0NC1iZWE3LTMzYTkwNTU4ZmVlZVwiLFwiUm9sZU5hbWVcIjpcIkN1c3RvbWVyXCIsXCJPcmdpbklkXCI6XCIwYzY1ODg0ZC1jNDBkLTRhZTEtYmQ0Ny01OGExYjRkMzU2MDFcIn1dIiwibmJmIjoxNjg3NDIzNTc1LCJleHAiOjE3MTg5NTk1NzUsImlzcyI6IlVDRFAiLCJhdWQiOiJCdWJsX3VzZXJzIn0.N0-_pzdshXuN0ikdcZJGj2M5s8ZwoRDJsePGTbWcGLs";
    }
    debugPrint(headers['Authorization']);
    return headers;
  }

  //print the data and help to copy the data
  printUrlAndHeaderAndBody({required String url, dynamic body, dynamic header, method}) async {
    debugPrint("----------------------------------------");
    debugPrint(url);
    debugPrint(jsonEncode(body));
    debugPrint(jsonEncode(header));
    debugPrint("----------------------------------------");
  }
}

enum HttpCodeEnum {
  ok,
  created,
  accepted,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  requestTimeout,
  internalServerError,
  refereshTokenReguired
}

extension HttpCodeEnumExtenstion on HttpCodeEnum {
  int get status {
    switch (this) {
      case HttpCodeEnum.ok:
        return 200;
      case HttpCodeEnum.created:
        return 201;
      case HttpCodeEnum.accepted:
        return 202;
      case HttpCodeEnum.badRequest:
        return 400;
      case HttpCodeEnum.unauthorized:
        return 401;
      case HttpCodeEnum.forbidden:
        return 403;
      case HttpCodeEnum.notFound:
        return 404;
      case HttpCodeEnum.requestTimeout:
        return 408;
      case HttpCodeEnum.internalServerError:
        return 500;
      case HttpCodeEnum.refereshTokenReguired:
        return 410;
      default:
        return 400;
    }
  }
}
