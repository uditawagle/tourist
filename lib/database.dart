import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:tourguide/classs/about.dart';
import 'package:tourguide/classs/hotelyak.dart';
import 'package:tourguide/classs/karnali.dart';
import 'package:tourguide/classs/ktmguest.dart';
import 'package:tourguide/classs/lastresort.dart';
import 'package:tourguide/classs/review.dart';
import 'package:tourguide/constant.dart';
import 'classs/pavilions.dart';


class DatabaseService{

//for about us 
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

//for reviews
  Future<List<Reviews>> rev() async {
    var dataa = await http.get(
      Uri.parse("$BASE_URL/api/review"),
    );
    var jsonData = json.decode((dataa.body));
    List<Reviews> rev = [];
    for (var each in jsonData) {
      Reviews reviewList = Reviews(
        text1: each['text1'], 
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
      rev.add(reviewList);
    }
    return rev;
  }

// for hotels description
  Future<List<Pavilion>> plist() async {
    var data = await http.get(
      Uri.parse("$BASE_URL/api/pavilions"),
    );
    var jsonData = json.decode((data.body));
    List<Pavilion> plist = [];
    for (var each in jsonData) {
      Pavilion pavilionsList = Pavilion(
       image: each['image'],
       name: each['name'],
       location: each['location'],
       title: each['title'],
       description: each['description'],
       title1: each['title1'],
       text1: each['text1'],
       text2: each['text2'],
       text3: each['text3'],
       text4: each['text4'],
       text5: each['text5'],
       text6: each['text6'],
       text7: each['text7'],
       text8: each['text8'],
       title3: each['title3'],
       title4: each['title4'],
       price: each['price'],
       button: each['button'],
    );
    print('kjdhsfkjhf');
      plist.add(pavilionsList);
    }
    return plist;
  }



  Future<List<TopKarnali>> klist() async {
    var data = await http.get(
      Uri.parse("$BASE_URL/api/karnali"),
    );
    var jsonData = json.decode((data.body));
    List<TopKarnali> klist = [];
    for (var each in jsonData) {
      TopKarnali karnaliList = TopKarnali(
       image: each['image'],
       name: each['name'],
       location: each['location'],
       title: each['title'],
       description: each['description'],
       title1: each['title1'],
       text1: each['text1'],
       text2: each['text2'],
       text3: each['text3'],
       text4: each['text4'],
       text5: each['text5'],
       text6: each['text6'],
       text7: each['text7'],
       text8: each['text8'],
       title3: each['title3'],
       title4: each['title4'],
       price: each['price'],
       button: each['button'],
    );
    print('kjdhsfkjhf');
      klist.add(karnaliList);
    }
    return klist;
  }


  
  Future<List<HotelYak>> hlist() async {
    var data = await http.get(
      Uri.parse("$BASE_URL/api/hotelyak"),
    );
    var jsonData = json.decode((data.body));
    List<HotelYak> hlist = [];
    for (var each in jsonData) {
      HotelYak yakList = HotelYak(
       image: each['image'],
       name: each['name'],
       location: each['location'],
       title: each['title'],
       description: each['description'],
       title1: each['title1'],
       text1: each['text1'],
       text2: each['text2'],
       text3: each['text3'],
       text4: each['text4'],
       text5: each['text5'],
       text6: each['text6'],
       text7: each['text7'],
       text8: each['text8'],
       title3: each['title3'],
       title4: each['title4'],
       price: each['price'],
       button: each['button'],
    );
      hlist.add(yakList);
    }
    return hlist;
  }


  
  Future<List<KtmGuest>> glist() async {
    var data = await http.get(
      Uri.parse("$BASE_URL/api/ktmguest"),
    );
    var jsonData = json.decode((data.body));
    List<KtmGuest> glist = [];
    for (var each in jsonData) {
      KtmGuest ktmList = KtmGuest(
       image: each['image'],
       name: each['name'],
       location: each['location'],
       title: each['title'],
       description: each['description'],
       title1: each['title1'],
       text1: each['text1'],
       text2: each['text2'],
       text3: each['text3'],
       text4: each['text4'],
       text5: each['text5'],
       text6: each['text6'],
       text7: each['text7'],
       text8: each['text8'],
       title3: each['title3'],
       title4: each['title4'],
       price: each['price'],
       button: each['button'],
    );
      glist.add(ktmList);
    }
    return glist;
  }

  
  Future<List<ResortLast>> rlist() async {
    var data = await http.get(
      Uri.parse("$BASE_URL/api/resortlast"),
    );
    var jsonData = json.decode((data.body));
    List<ResortLast> rlist = [];
    for (var each in jsonData) {
      ResortLast resortList = ResortLast(
       image: each['image'],
       name: each['name'],
       location: each['location'],
       title: each['title'],
       description: each['description'],
       title1: each['title1'],
       text1: each['text1'],
       text2: each['text2'],
       text3: each['text3'],
       text4: each['text4'],
       text5: each['text5'],
       text6: each['text6'],
       text7: each['text7'],
       text8: each['text8'],
       title3: each['title3'],
       title4: each['title4'],
       price: each['price'],
       button: each['button'],
    );
    print('kjdhsfkjhf');
      rlist.add(resortList);
    }
    return rlist;
  }


// for feedback 
  Future<int> insertfeedback(String uid, String email, String rate, String feedbacks) async {
    print(email);
    print(rate);
    print(feedbacks);
    var data = await http.get(
      Uri.parse("$BASE_URL/api/insertfeedback?uid=${uid}&email=${email}&rate=${rate}&feedback=${feedbacks}"),
    );
    print('aayo');
    int code = data.statusCode;
    var jsonData = json.decode((data.body));
    String? val = jsonData["error"];
    if (val == null) {
      val = "";
    }
    print(val);
    return code;
  }

//for booking 
  Future<int> insertbooking(String name, String checkin, String checkout, String roomneeded, String adult, String child ) async {
     print(name);
     print(child);
     print(checkin);
     print(checkout);
    var data = await http.get(
      Uri.parse("$BASE_URL/api/insertbooking?name=${name}&checkin=${checkin}&checkout=${checkout}}&roomneeded=${roomneeded}&adult=${adult}&child=${child}"),
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

//for login 
Future<int> insertlogin(String emails, String passwords) async {
   var data = await http.get(
     Uri.parse("$BASE_URL/api/insertlogin?email=${emails}&password=${passwords}"),
   );
    var jsonData = json.decode((data.body));
    emails = jsonData[0]['email'];
    print(emails);
    return data.statusCode;
  }


//for signup
Future<int> insertRegistration(String name, String email, String password) async {
    var data = await http.get(
      Uri.parse("$BASE_URL/api/insertsignup?name=${name}&email=${email}&password=${password}"),
    );
    print(email);
    print(name);
    print(password);
    print('aayo');
    int code = data.statusCode;
    var jsonData = json.decode((data.body));
    String? val = jsonData["error"];
    if (val == null) {
      val = "";
    }
    print(val);
    return code;
  }


}



