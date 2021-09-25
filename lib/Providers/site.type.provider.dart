import 'dart:convert' as convert;
import 'package:casanareapp/models/site_type.dart';
import 'package:http/http.dart' as http;

class SiteTypeProvider {
  Future<List<SiteType>> getSiteType({int page = 1}) async {
    List<SiteType> listaSitesType = [];

    var response =
        await http.get(Uri.https('casanare.app', '/api/v1/Catalog/siteTypes'));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      print(jsonResponse);
      jsonResponse
          .forEach((item) => listaSitesType.add(SiteType.fromJson(item)));
    }
    return listaSitesType;
  }
}
