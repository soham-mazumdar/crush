import 'dart:convert';
import 'dart:developer';
import 'package:crush/redux/models/InfoModel.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:crush/redux/models/User.dart';
// import 'package:crush/util/variables.dart';

class DataService {
  

  Future<Info> fetch() async{
    return http.get('http://maddlytech.com/demos/crush/ok.json',
      headers: {'Content-Type': 'application/json','accept': 'application/json'},
    ).then((http.Response value){
      log(value.body.toString());
      List user = jsonDecode(value.body);
      Info info = Info.fromJson(user[0]);
      print(info.services[0].price);
      return info;
    });
  }

  // ignore: missing_return
  

}