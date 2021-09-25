import 'package:casanareapp/Providers/business.provider.dart';
import 'package:casanareapp/models/business.model.dart';
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
  List<Business>? business = [];

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
  //business = bussinessProvider.getList({page: 1})

  @override
  void initState() {
    //_futureSite = siteProvidor.getSite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  title: Text(titles[index]),
                  subtitle: Text(subtitles[index]),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                  trailing: Icon(icons[index])));
        });
  }
}
