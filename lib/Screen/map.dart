import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService{
  final String key = 'AIzaSyCe4ejammMJApTe_lH1ZRi29vs7CBv-G_4';

  Future<String> getPlaceId(String input) async{
    final String url =
    'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeId = json['candidates'][0]['place_id'] as String;

    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async{
    final placeId = await getPlaceId(input);

    final String url =
    'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

    
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var result = json['result'] as Map<String, dynamic>;

    return result;

  }
}