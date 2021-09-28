import 'dart:convert' as convert;
import 'package:casanareapp/models/business.model.dart';
import 'package:http/http.dart' as http;

class BussinessProvider {
  Future<List<Business>> getBussiness(
      {required int cityId,
      required int siteTypeId,
      required String text,
      int page = 1}) async {
    List<Business> listBussiness = [];

    if (text.isEmpty) {
      text = "*";
    }

    var response = await http.get(Uri.https('casanare.app',
        '/api/v1/Sites/Search/$text/$cityId/$siteTypeId/0/true/$page/10'));
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      jsonResponse["sites"]
          .forEach((item) => listBussiness.add(Business.fromJson(item)));
    }
    return listBussiness;
  }
}
