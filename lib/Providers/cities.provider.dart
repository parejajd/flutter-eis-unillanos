import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:casanareapp/models/cities.model.dart';

class CitiesProvider {
  Future<List<Cities>> getCities({int page = 1}) async {
    List<Cities> listaCities = [];

    var response =
        await http.get(Uri.https('casanare.app', '/api/v1/Catalog/cities/1'));
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse["name"]
          .forEach((item) => listaCities.add(Cities.fromJson(item)));
    }
    return listaCities;
  }
}
