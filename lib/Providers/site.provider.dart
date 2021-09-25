import 'dart:convert' as convert;
import 'package:casanareapp/models/site.dart';
import 'package:http/http.dart' as http;

class SiteProvider {
  Future<Site> getSite({int siteId = 16142}) async {
    Site? site = null;

    var response = await http
        .get(Uri.https('casanare.app', '/api/v1/Sites/viewById/$siteId'));
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse["name"].forEach((item) => site = Site.fromJson(item));
    }
    return site!;
  }
}
