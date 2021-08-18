import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practice_project/web_api/web_api_model.dart';

class WebGlobal{

  static WebApi? webApi;

  static getData() async {
    List<WebApi> list = [];

    http.Response response =  await http.get(Uri.parse('https://thepressofindia.com/wp-json/wp/v2/posts'));
    var parseData = jsonDecode(response.body);
    list = (parseData as List).map((e) => WebApi.fromJson(e)).toList();
    print(jsonEncode(list));
    return list;
  }

}