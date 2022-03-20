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

  Future<int> insertFeedback(
    String uid, String email, String rate, String feedbacks) async {
    var data = await http.get(
      Uri.parse("$BASE_URL/api/insertFeedback?Uid=${uid}Email=${email}&Rate=${rate}&Feedback=${feedbacks}"),
    );
    int code = data.statusCode;
    var jsonData = json.decode((data.body));
    String val = jsonData["error"];
    // ignore: unnecessary_null_comparison
    if (val == null) {
      val = "";
    }
    print(val);
    return code;
  }


Future<int> insertlogin(
    String email, String password) async {
    var data = await http.get(
      Uri.parse("$BASE_URL/api/insertlogin?email=${email}&password=${password}}"),
    );
    int code = data.statusCode;
    var jsonData = json.decode((data.body));
    String val = jsonData["error"];
    // ignore: unnecessary_null_comparison
    if (val == null) {
      val = "";
    }
    print(val);
    return code;
  }
}

