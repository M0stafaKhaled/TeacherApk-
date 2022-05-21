import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:teacher/models/Welcome.dart';
class fetchApi{

    Future<List <Welcome>? >fetchScore()async{
    //List <Welcome> we = [];
   String KEY=  dotenv.env['API_URL'] ?? "localhost";
   print(KEY);
    http.Response response = await http.get(Uri.parse('$KEY/api/scores'));
    if(response.statusCode==200){
      var body = jsonDecode(response.body)['data'];
      // body=body.data;
     print(body);
      List <Welcome > we = [];
      for(var item in body){
        we.add(Welcome.fromJson(item));
      }

      return we;
    }
    // return null;
  }

}