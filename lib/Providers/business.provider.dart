import 'dart:convert' as convert;
import 'package:casanareapp/models/business.model.dart';
import 'package:http/http.dart' as http;

class BussinessProvider {
  Future<List<Business>> getBussiness({int page = 1}) async {
    List<Business> listBussiness = [];

    var response =
        await http.get(Uri.https('casanare.app', '/api/v1/Sites/Search/restaurante/0/0/0/true/1/10'));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      print(jsonResponse);
      jsonResponse.forEach((item) => listBussiness.add(Business.fromJson(item)));
    }
    return listBussiness;
  }
}
