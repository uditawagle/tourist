import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:tourguide/classs/about.dart';
import 'package:tourguide/constant.dart';

class DatabaseService{

  Future<List<About>> allitem() async {
    var data = await http.get(
      Uri.parse("$BASE_URL/api/about"),
    );

    var jsonData = json.decode((data.body));

    List<About> allitems = [];
    for (var each in jsonData) {
      About aboutList = About(
          image: each['image'],
          name: each['name'],
          status: each['status'],
          bio: each['bio'],
          bioo: each['bioo'],
          );
      allitems.add(aboutList);
    }
    return allitems;
  }

  Future<int> insertFeedback(String email, String rate, String feedbacks) async {
    print(email);
    print(rate);
    print(feedbacks);
    var data = await http.get(
      Uri.parse("$BASE_URL/api/insertFeedback?email=${email}&rate=${rate}&feedback=${feedbacks}"),
    );
    int code = data.statusCode;
    var jsonData = json.decode((data.body));
    String? val = jsonData["error"];
    if (val == null) {
      val = "";
    }
    print(val);
    return code;
  }


Future<int> login( String email, String password) async {
  print(email);
  print(password);
    var data = await http.get(
      Uri.parse("$BASE_URL/api/login?email=${email}&password=${password}"),
    );
    print('aayo');
    print(data);
    //int code = data.statusCode;
    //var jsonData = json.decode((data.body));
    //String? val = jsonData["error"];
    // if (val == null) {
    //   val = "";
    // }
    //print(code);
    return 200;
  }
}

