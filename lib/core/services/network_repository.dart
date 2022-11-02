import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:poker/core/utils/PreferenceHelper.dart';
import 'package:poker/features/login/model/login_model.dart';
import 'package:poker/main.dart';



Future<LoginModel>? getUserData() async {
  try {
    String? strUserData =
        PreferenceHelper.getString(PreferenceHelper.USER_DATA);
    printWrapped('userdata-->${strUserData}');
    var userData = LoginModel.fromJson(json.decode(strUserData!));
    return userData;
  } catch (c) {
    return LoginModel();
  }
}

Future callPostMethod(String url, Map<String, dynamic> params) async {
  printWrapped("params--" + jsonEncode(params));
  printWrapped("baseUrl--" + url);
  return await http.post(
    Uri.parse(url),
    body: utf8.encode(json.encode(params)),
    headers: {'Content-Type': 'application/json', 'accept': '*/*'},
  ).then((http.Response response) {
    return getResponse(response);
  });
}


void printWrapped(String text) {
  final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


Future getResponse(Response response) async {
  final int statusCode = response.statusCode;
  printWrapped("response--statusCode--" + response.statusCode.toString());
  printWrapped("response--" + response.body);
  if (statusCode == 500 || statusCode == 502) {
    return "{\"status\":\"0\",\"message\":\"Internal server issue\"}";
  } else if (statusCode == 401) {
    MyApp.navKey.currentContext;
  //  WidgetUtils.showDialogForSessiontimeOut();
    // showDialog(
    //   barrierDismissible: false,
    //   context: MyApp.navKey.currentContext!,
    //   builder: (_) => CupertinoAlertDialog(
    //     title: Text("Session TimeOut"),
    //     content: Text("Please SignIn again"),
    //     actions: <Widget>[
    //       CupertinoDialogAction(
    //         onPressed: () {
    //           Navigator.pushNamedAndRemoveUntil(MyApp.navKey.currentContext!,
    //               RouteName.loginScreen, (route) => false);
    //         },
    //         isDefaultAction: true,
    //         child: Text("Okay"),
    //       ),
    //     ],
    //   ),
    // );

    // Navigator.pushNamedAndRemoveUntil(
    //     MyApp.navKey.currentContext!, RouteName.loginScreen, (route) => false);
    // WidgetUtils.showSnackbar(MyApp.navKey.currentContext!, 'Session Time Out');
    // Unauthorised streams = Unauthorised.fromJson(json.decode(response.body));
    // clearData();
    // return "{\"status\":\"0\",\"message\":\"${streams.message}\"}";
    return "{\"status\":\"0\",\"message\":\"Internal server issue\"}";
  } else if (statusCode == 403) {
    // Unauthorised streams = Unauthorised.fromJson(json.decode(response.body));
    // return "{\"status\":\"0\",\"message\":\"${streams.message}\"}";
    return "{\"status\":\"0\",\"message\":\"Internal server issue\"}";
  } else if (statusCode == 405) {
    String error = "This Method not allowed.";
    printWrapped("response--" + error);
    return "{\"status\":\"0\",\"message\":\"${error}\"}";
  } else if (statusCode == 400) {
    // Unauthorised streams = Unauthorised.fromJson(json.decode(response.body));
    // return "{\"status\":\"0\",\"message\":\"${streams.message}\"}";
    return "{\"status\":\"0\",\"message\":\"Internal server issue\"}";
  } else if (statusCode < 200 || statusCode > 404 || json == null) {
    String error = response.headers['message'].toString();
    printWrapped("response--" + error);
    return "{\"status\":\"0\",\"message\":\"${error}\"}";
  }
  return response.body;
}

