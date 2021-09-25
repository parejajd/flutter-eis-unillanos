import 'package:casanareapp/Providers/site.provider.dart';
import 'package:casanareapp/models/site.dart';
import 'package:casanareapp/widgets/layout/custombar.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final SiteProvider siteProvidor = SiteProvider();
  late Future<Site> _futureSite;

  @override
  void initState() {
    _futureSite = siteProvidor.getSite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'Add',
        onPressed: () {},
        tooltip: "Llamar",
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }

  _body() {
    return FutureBuilder(
      future: _futureSite,
      builder: (BuildContext context, AsyncSnapshot<Site> snapshot) {
        if (snapshot.hasData) {
          Site? site = snapshot.data;

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    "Titulo",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SelectableText(
                    "Subtitulo",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 48),
                  SelectableText("Contenido",
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
