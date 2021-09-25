import 'package:casanareapp/Providers/site.provider.dart';
import 'package:casanareapp/models/site.dart';
import 'package:casanareapp/widgets/expandablebutton.dart';
import 'package:casanareapp/widgets/layout/custombar.dart';
import 'package:flutter/material.dart';
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
  final controller = MapController(
    location: LatLng(35.68, 51.41),
  );

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
    return SafeArea(
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
                    onPressed: () {},
                    child: Icon(Icons.facebook),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.facebook),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.facebook),
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
            Map(
              controller: controller,
              builder: (context, x, y, z) {
                //Legal notice: This url is only used for demo and educational purposes. You need a license key for production use.

                //Google Maps
                final url =
                    'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

                final darkUrl =
                    'https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i$z!2i$x!3i$y!4i256!2m3!1e0!2sm!3i556279080!3m17!2sen-US!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC52Om9uLHMuZTpsfHAudjpvZmZ8cC5zOi0xMDAscy5lOmwudC5mfHAuczozNnxwLmM6I2ZmMDAwMDAwfHAubDo0MHxwLnY6b2ZmLHMuZTpsLnQuc3xwLnY6b2ZmfHAuYzojZmYwMDAwMDB8cC5sOjE2LHMuZTpsLml8cC52Om9mZixzLnQ6MXxzLmU6Zy5mfHAuYzojZmYwMDAwMDB8cC5sOjIwLHMudDoxfHMuZTpnLnN8cC5jOiNmZjAwMDAwMHxwLmw6MTd8cC53OjEuMixzLnQ6NXxzLmU6Z3xwLmM6I2ZmMDAwMDAwfHAubDoyMCxzLnQ6NXxzLmU6Zy5mfHAuYzojZmY0ZDYwNTkscy50OjV8cy5lOmcuc3xwLmM6I2ZmNGQ2MDU5LHMudDo4MnxzLmU6Zy5mfHAuYzojZmY0ZDYwNTkscy50OjJ8cy5lOmd8cC5sOjIxLHMudDoyfHMuZTpnLmZ8cC5jOiNmZjRkNjA1OSxzLnQ6MnxzLmU6Zy5zfHAuYzojZmY0ZDYwNTkscy50OjN8cy5lOmd8cC52Om9ufHAuYzojZmY3ZjhkODkscy50OjN8cy5lOmcuZnxwLmM6I2ZmN2Y4ZDg5LHMudDo0OXxzLmU6Zy5mfHAuYzojZmY3ZjhkODl8cC5sOjE3LHMudDo0OXxzLmU6Zy5zfHAuYzojZmY3ZjhkODl8cC5sOjI5fHAudzowLjIscy50OjUwfHMuZTpnfHAuYzojZmYwMDAwMDB8cC5sOjE4LHMudDo1MHxzLmU6Zy5mfHAuYzojZmY3ZjhkODkscy50OjUwfHMuZTpnLnN8cC5jOiNmZjdmOGQ4OSxzLnQ6NTF8cy5lOmd8cC5jOiNmZjAwMDAwMHxwLmw6MTYscy50OjUxfHMuZTpnLmZ8cC5jOiNmZjdmOGQ4OSxzLnQ6NTF8cy5lOmcuc3xwLmM6I2ZmN2Y4ZDg5LHMudDo0fHMuZTpnfHAuYzojZmYwMDAwMDB8cC5sOjE5LHMudDo2fHAuYzojZmYyYjM2Mzh8cC52Om9uLHMudDo2fHMuZTpnfHAuYzojZmYyYjM2Mzh8cC5sOjE3LHMudDo2fHMuZTpnLmZ8cC5jOiNmZjI0MjgyYixzLnQ6NnxzLmU6Zy5zfHAuYzojZmYyNDI4MmIscy50OjZ8cy5lOmx8cC52Om9mZixzLnQ6NnxzLmU6bC50fHAudjpvZmYscy50OjZ8cy5lOmwudC5mfHAudjpvZmYscy50OjZ8cy5lOmwudC5zfHAudjpvZmYscy50OjZ8cy5lOmwuaXxwLnY6b2Zm!4e0&key=AIzaSyAOqYYyBbtXQEtcHG7hwAwyCPQSYidG8yU&token=31440';
                //Mapbox Streets
                // final url =
                //     'https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/$z/$x/$y?access_token=YOUR_MAPBOX_ACCESS_TOKEN';

                return CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.cover,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
