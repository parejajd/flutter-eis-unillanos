import 'package:casanareapp/models/business.model.dart';
import 'package:casanareapp/pages/site.details.dart';
import 'package:casanareapp/widgets/cards/style.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class CardWidget extends StatelessWidget {
  final Business business;

  CardWidget({required this.business});

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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(id: business.id),
          ),
        );
      },
      child: Card(
        child: Container(
          height: 100,
          child: Row(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Expanded(
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(business.logo)),
                    flex: 2,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: ListTile(
                          title:
                              Text(business.name, style: Style.titleTextStyle),
                          subtitle: Text(business.address,
                              style: Style.smallTextStyle),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              child:
                                  Text("Llamar", style: Style.buttonTextStyle),
                              onPressed: () async {
                                callnow(phone: business.phoneNumber);
                              },
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            ElevatedButton(
                              child: Text("WhatsApp",
                                  style: Style.buttonTextStyle),
                              onPressed: () async {
                                launchWhatsApp(phone: business.phoneNumber);
                              },
                            ),
                            SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                flex: 8,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(Icons.arrow_forward_ios),
                ),
              )
            ],
          ),
        ),
        elevation: 8,
        margin: EdgeInsets.all(20),
        shadowColor: Color(0xFF311B92),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF311B92), width: 1)),
      ),
    );
  }
}
