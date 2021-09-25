import 'package:casanareapp/Providers/site.provider.dart';
import 'package:casanareapp/models/site.dart';
import 'package:casanareapp/widgets/expandablebutton.dart';
import 'package:casanareapp/widgets/layout/custombar.dart';
import 'package:casanareapp/widgets/sites.map.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:map/map.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latlng/latlng.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    if (await canLaunch("tel:" + phone)) {
      await launch("tel:" + phone);
    } else {
      throw 'call not possible';
    }
  }

  Future<void> launchWhatsApp({required String phone}) async {
    if (await canLaunch("https://wa.me/+57$phone")) {
      await launch("https://wa.me/+57$phone");
    } else {
      throw 'Call Link not possible';
    }
  }

  Future<void> launchWeb({required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Open Link not possible';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureSite,
        builder: (BuildContext context, AsyncSnapshot<Site> snapshot) {
          if (snapshot.hasData) {
            Site? site = snapshot.data;
            return Scaffold(
              appBar: AdaptiveAppBar(site: site!),
              body: _body(site: site),
              floatingActionButton: ExpandableFab(
                distance: 112.0,
                children: [
                  ActionButton(
                    onPressed: () => {callnow(phone: site.phoneNumber)},
                    icon: const Icon(Icons.call),
                  ),
                  ActionButton(
                    onPressed: () => {launchWhatsApp(phone: site.phoneNumber)},
                    icon: const Icon(Icons.message),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  _body({required Site site}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              site.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            SelectableText(
              site.businessPhrase,
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
              site.businessDescription,
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
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () async {
                      launchWeb(url: site.facebookUrl);
                    },
                    child: Icon(FontAwesomeIcons.facebookF),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () async {
                      launchWeb(url: site.twitterUrl);
                    },
                    child: Icon(FontAwesomeIcons.twitter),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () async {
                      launchWeb(url: site.instagramUrl);
                    },
                    child: Icon(FontAwesomeIcons.instagram),
                  ),
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
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MarkersPage(
                      site: site,
                    ),
                  ),
                );
              },
              child: Icon(FontAwesomeIcons.mapMarkerAlt),
            )
          ],
        ),
      ),
    );
  }
}
