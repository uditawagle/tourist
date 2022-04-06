import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:tourguide/classs/about.dart';
import 'package:tourguide/constant.dart';
import 'package:tourguide/pages/review.dart';

class DatabaseService{

  Future<List<About>> allitem() async {
    var data = await http.get(
      Uri.parse("$BASE_URL/api/about"),
    );
    var jsonData = json.decode((data.body));
    List<About> allitems = [];
    for (var each in jsonData) {
      About aboutList = About(
        imagee: each['imagee'],
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

  Future<List<Reviews>> list() async {
    var dataa = await http.get(
      Uri.parse("$BASE_URL/api/review"),
    );
    var jsonData = json.decode((dataa.body));
    List<Reviews> list = [];
    for (var each in jsonData) {
      Reviews reviewList = Reviews(
        text1: each['text1;'],
        subtext1: each['subtext1'],
        image1: each['image1'],
        text2: each['text2'],
        subtext2: each['subtext2'],
        image2: each['image2'],
        text3: each['text3'],
        subtext3: each['subtext3'],
        image3: each['image3'],
        text4: each['text4'],
        subtext4: each['subtext4'],
        image4: each['image4'],
        text5: each['text5'],
        subtext5: each['subtext5'],
        image5: each['image5'],
        text6: each['text6'],
        subtext6: each['subtext6'],
        image6: each['image6'],
    );
      list.add(reviewList);
    }
    return list;
  }




  Future<int> insertFeedback(String email, String rate, String feedbacks) async {
    // print(email);
    // print(rate);
    // print(feedbacks);
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

