import 'package:casanareapp/Providers/cities.provider.dart';
import 'package:casanareapp/Providers/site.type.provider.dart';
import 'package:casanareapp/models/cities.model.dart';
import 'package:casanareapp/models/site_type.dart';
import 'package:casanareapp/pages/businessList.pages.dart';
import 'package:casanareapp/pages/site.details.dart';
import 'package:casanareapp/widgets/sites.map.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CitiesProvider citiesProvider = CitiesProvider();
  final SiteTypeProvider siteTypeProvider = SiteTypeProvider();
  Future<List<Cities>>? listaCities;
  Future<List<SiteType>>? listaSitesType;

  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;
  Object? values, values1;
  Cities? name;
  SiteType? names;
  final myController = TextEditingController();

  @override
  void initState() {
    listaCities = citiesProvider.getCities();
    listaSitesType = siteTypeProvider.getSiteType();
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 100.0,
            backgroundColor: const Color.fromRGBO(33, 37, 41, 10),
            flexibleSpace: Image.network(
                'https://www.casanare.app/img/core-img/cd-logo_white.png'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.menu),
                alignment: Alignment.bottomLeft,
                // ignore: avoid_print
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(id: 16142)))
                },
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(100, 10, 100, 80),
              child: SizedBox(
                height: 80,
                child: Center(
                  child: Text(
                    'Todo lo que buscas está en un solo lugar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 55,
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Container(
                  child: const Text(
                    'Directorio',
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Color.fromRGBO(67, 25, 161, 0.90),
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Container(
                    child: const Text(
                      '¿Que estas Buscando?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(67, 25, 161, 0.90),
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(8))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Container(
                    child: FutureBuilder<List<Cities>>(
                      future: listaCities,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButton(
                            value: name,
                            onChanged: (Cities? newValue) {
                              setState(() {
                                name = newValue;
                                print("${name!.id}");
                              });
                            },
                            iconSize: 36,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.black),
                            isExpanded: true,
                            items: snapshot.data!
                                .map<DropdownMenuItem<Cities>>((Cities value) {
                              return DropdownMenuItem<Cities>(
                                key: Key(value.id.toString()),
                                value: value,
                                child: Text(value.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    )),
                              );
                            }).toList(),
                            dropdownColor: Colors.black,
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(67, 25, 161, 0.90),
                      border: Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Container(
                    child: FutureBuilder<List<SiteType>>(
                      future: listaSitesType,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return DropdownButton(
                            value: names,
                            onChanged: (SiteType? newValue1) {
                              setState(() {
                                names = newValue1;
                                print("${names!.id}");
                              });
                            },
                            iconSize: 36,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.black),
                            isExpanded: true,
                            items: snapshot.data!
                                .map<DropdownMenuItem<SiteType>>(
                                    (SiteType values1) {
                              return DropdownMenuItem<SiteType>(
                                key: Key(values1.id.toString()),
                                value: values1,
                                child: Text(values1.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    )),
                              );
                            }).toList(),
                            dropdownColor: Colors.black,
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(67, 25, 161, 0.90),
                      border: Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              hintText: "Palabras Clave de la Busqueda",
                              fillColor: Colors.white,
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            controller: myController,
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(67, 25, 161, 0.90),
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(8))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Container(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (name == null || names == null) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              // Retrieve the text the that user has entered by using the
                              // TextEditingController.
                              content: Text("Error ingresa datos para buscar"),
                            );
                          },
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListBusinessPage(
                                cityId: name!.id,
                                siteTypeId: names!.id,
                                text: myController.text),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(118, 67, 234, 1)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 20)),
                    ),
                    icon: const Icon(Icons.search, size: 18),
                    label: const Text('BUSCAR'),
                  ),
                  alignment: Alignment.topRight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Container(
                  child: _botones(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Container(
                  child: _botones(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Container(
                  child: _botones(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Container(
                  child: _botones(),
                ),
              ),
            ]),
          ),
        ],
      ),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/casanare.jpg"),
        scale: 1000, // <-- BACKGROUND IMAGE
        fit: BoxFit.cover,
      )),
    ));
  }

  _botones() {
    return ElevatedButton.icon(
      onPressed: () {
        // Respond to button press
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(118, 67, 234, 1)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
      ),
      icon: const Icon(Icons.add_a_photo, size: 18),
      label: const Text("Mejoras"),
    );
  }
}
