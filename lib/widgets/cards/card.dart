import 'package:casanareapp/models/business.model.dart';
import 'package:casanareapp/pages/site.details.dart';
import 'package:casanareapp/widgets/cards/style.dart';
import 'package:flutter/material.dart';


class CardWidget extends StatelessWidget {
  final Business business;

  CardWidget({required this.business});

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
        color: const Color.fromRGBO(52, 26, 121, 1),
        shadowColor: Colors.green,
        child: ListTile(
            title: Text(business.name, style: Style.titleTextStyle),
            subtitle: Text(business.address, style: Style.commonTextStyle),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(business.logo)
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white)
        )
      )
    );
  }
}