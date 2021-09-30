import 'package:casanareapp/Providers/business.provider.dart';
import 'package:casanareapp/models/business.model.dart';
import 'package:casanareapp/pages/site.details.dart';
import 'package:casanareapp/widgets/cards/card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListBusinessPage extends StatefulWidget {
  int cityId;
  int siteTypeId;
  String text;
  String cityName;

  ListBusinessPage(
      {required this.cityId,
      required this.cityName,
      required this.siteTypeId,
      required this.text});

  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<ListBusinessPage> {
  Future<List<Business>>? business;

  final icons = [
    Icons.ac_unit,
    FontAwesomeIcons.whatsapp,
    FontAwesomeIcons.twitter
  ];

  final BussinessProvider bussinessProvider = BussinessProvider();

  @override
  void initState() {
    if (widget.text.isEmpty) {
      widget.text = "*";
    }
    business = bussinessProvider.getBussiness(
        cityId: widget.cityId,
        siteTypeId: widget.siteTypeId,
        text: widget.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SliverAppBar is declared in Scaffold.body, in slivers of a
      // CustomScrollView.
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.cityName),
              background: Image.asset(
                'assets/casanare.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          // If the main content is a list, use SliverList instead.
          SliverFillRemaining(
            child: _body(context),
          ),
        ],
      ),
    );
  }

  _body(BuildContext context) {
    return FutureBuilder(
        future: business,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Business>? businesses = snapshot.data;
            List<Widget> list = [];

            for (var business in businesses!) {
              list.add(CardWidget(business: business));
            }
            return ListView(children: list);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
