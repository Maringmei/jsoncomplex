import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:jsoncomplex/Model/RestModel.dart';

void main() {
  runApp(MyApp());
}

class NetHelper {
  Future<RestModel> getData() async {
    print("net 1");
    Response response = await http.get(Uri.parse("https://hadescrypto.000webhostapp.com/complexjson.json"));
    print(jsonDecode(response.body));
    return  RestModel.fromJson(jsonDecode(response.body));;
  }
}

class MyApp extends StatelessWidget {

  NetHelper netHelper = NetHelper();
 getD()async{
   final response = await netHelper.getData();
   RestModel _response = response;
   print(_response.name);
   print(_response.cuisine);
   print(_response.reviews[0].score);
   print(_response.reviews[1].score);

 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              getD();
            },
            child: Text("restult"),
          )
        ),
      ),
    );
  }
}
