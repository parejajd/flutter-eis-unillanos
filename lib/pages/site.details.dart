import 'package:casanareapp/Providers/site.provider.dart';
import 'package:casanareapp/models/site.dart';
import 'package:casanareapp/widgets/layout/custombar.dart';
import 'package:flutter/material.dart';
import 'package:map/map.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  int id = 16142;

  DetailsPage({required this.id});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final SiteProvider siteProvidor = SiteProvider();
  late Future<Site> _futureSite;

  @override
  void initState() {
    _futureSite = siteProvidor.getSite(siteId: widget.id);
    super.initState();
  }

  Future<void> callnow({required String phone}) async {
    if (await canLaunch("tel:+" + phone)) {
      await launch("tel:+" + phone);
    } else {
      throw 'call not possible';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'Llamar',
        onPressed: () async {
          callnow(phone: (await _futureSite).phoneNumber);
        },
        tooltip: "Llamar",
        child: Icon(
          Icons.call,
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
                    site!.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SelectableText(
                    site!.businessPhrase,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SelectableText(
                    "¿Quienes somos?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SelectableText(
                    site!.businessDescription,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SelectableText(
                    "¿Que hacemos?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SelectableText(
                    site.ciiU1,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SelectableText(
                    site.ciiU2,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SelectableText(
                    site.ciiU3,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SelectableText(
                    site.ciiU4,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SelectableText(
                    "Encuentranos en",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.facebook),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.facebook),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(Icons.facebook),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SelectableText(
                    "¿En que lugar nos encuentras?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
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
