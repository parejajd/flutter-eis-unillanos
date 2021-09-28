import 'package:casanareapp/Providers/business.provider.dart';
import 'package:casanareapp/models/business.model.dart';
import 'package:casanareapp/pages/site.details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListBusinessPage extends StatefulWidget {
  int cityId;
  int siteTypeId;
  String text;

  ListBusinessPage(
      {required this.cityId, required this.siteTypeId, required this.text});

  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<ListBusinessPage> {
  Future<List<Business>>? business;

  final titles = ["Negocio 1", "Negocio 2", "Negocio 3"];
  final subtitles = [
    "Here is Negocio 1 subtitle",
    "Here is Negocio 2 subtitle",
    "Here is Negocio 3 subtitle"
  ];
  final icons = [
    Icons.ac_unit,
    FontAwesomeIcons.whatsapp,
    FontAwesomeIcons.twitter
  ];

  final BussinessProvider bussinessProvider = BussinessProvider();

  @override
  void initState() {
    business = bussinessProvider.getBussiness(
        cityId: widget.cityId,
        siteTypeId: widget.siteTypeId,
        text: widget.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: business,
      builder: (BuildContext context, AsyncSnapshot<List<Business>> snapshot) {
        if (snapshot.hasData) {
          List<Business>? articles = snapshot.data;
          List<Widget> list = [];

          for (var article in articles!) {
            list.add(GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(id: article.id)),
                  );
                },
                child: Card(
                    child: ListTile(
                        title: Text(article.name),
                        subtitle: Text(article.address),
                        leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                        trailing: Icon(Icons.keyboard_arrow_right)))));
          }
          return ListView(children: list);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
