import 'package:casanareapp/Providers/business.provider.dart';
import 'package:casanareapp/models/business.model.dart';
import 'package:casanareapp/pages/site.details.dart';
import 'package:flutter/material.dart';

// Adapted from offical flutter gallery:
// https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/bottom_app_bar_demo.dart
class SliverAppBarExample extends StatefulWidget {
  int cityId;
  int siteTypeId;
  String text;
  String cityName;

  SliverAppBarExample(
      {required this.cityId,
      required this.cityName,
      required this.siteTypeId,
      required this.text});

  @override
  State<StatefulWidget> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  bool _pinned = true;
  bool _snap = true;
  bool _floating = true;
  Future<List<Business>>? business;
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
            pinned: this._pinned,
            snap: this._snap,
            floating: this._floating,
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
            child: buildList(context),
          ),
        ],
      ),
    );
  }

  Widget buildList(BuildContext context) {
    return FutureBuilder(
      future: business,
      builder: (BuildContext context, AsyncSnapshot<List<Business>> snapshot) {
        if (snapshot.hasData) {
          List<Business>? businesses = snapshot.data;
          List<Widget> list = [];

          for (var business in businesses!) {
            list.add(GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(id: business.id)),
                  );
                },
                //return Container()
                child: Card(
                    child: ListTile(
                        title: Text(business.name),
                        subtitle: Text(business.address),
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
