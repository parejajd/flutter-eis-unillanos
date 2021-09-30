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
          child:Container(
            height: 100,
            color: Colors.white,
            child: Row(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Expanded(
                      child:CircleAvatar(
                          backgroundImage: NetworkImage(business.logo)
                      ),
                      flex:2 ,
                    ),
                  ),
                ),
                Expanded(
                  child:Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: ListTile(
                            title: Text(business.name, style: Style.titleTextStyle),
                            subtitle: Text(business.address, style: Style.smallTextStyle),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                child: Text("Llamar", style: Style.buttonTextStyle),
                                onPressed: ()
                                {},
                              ),
                              SizedBox(width: 8,),
                              ElevatedButton(
                                child: Text("Sms", style: Style.buttonTextStyle),
                                onPressed: (){},
                              ),
                              SizedBox(width: 8,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  flex:8 ,
                ),
              ],
            ),
          ),
          elevation: 8,
          margin: EdgeInsets.all(20),
          shadowColor: Color(0xFF311B92),
          shape:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xFF311B92), width: 1)
          ),
        ),
    );
  }
}