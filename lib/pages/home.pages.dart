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
            expandedHeight: 70.0,
            backgroundColor: const Color.fromRGBO(52, 26, 121, 1),
            flexibleSpace:
                Image.asset('assets/logo.png', alignment: Alignment.centerLeft),
            actions: <Widget>[
              Container(
                  child: IconButton(
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
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5),
                  )),
            ],
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 80, 10, 100),
              child: SizedBox(
                height: 60,
                child: Center(
                  child: Text(
                    'Todo lo que buscas está en un solo lugar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 400, 0),
              child: Container(
                width: 30.0,
                height: 50.0,
                child: const Text(
                  '      DIRECTORIO     ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(67, 25, 161, 2.90),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: _body(),
          )),
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

  _body() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 0, 20),
            child: Container(
              child: const Text(
                '¿Que estas Buscando?',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
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
                                  color: Colors.black,
                                )),
                          );
                        }).toList(),
                        hint: const Text("    Municipio"),
                        dropdownColor: Colors.white,
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
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
                        items: snapshot.data!.map<DropdownMenuItem<SiteType>>(
                            (SiteType values1) {
                          return DropdownMenuItem<SiteType>(
                            key: Key(values1.id.toString()),
                            value: values1,
                            child: Text(values1.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                )),
                          );
                        }).toList(),
                        hint: const Text("    Tipo de lugar"),
                        dropdownColor: Colors.white,
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
            child: Container(
                child: Center(
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          hintText: "     Palabras Clave de la Busqueda",
                          fillColor: Colors.black38,
                          hintStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                        controller: myController,
                      ),
                    ],
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(250, 0, 40, 0),
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
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  textStyle:
                      MaterialStateProperty.all(const TextStyle(fontSize: 30)),
                ),
                icon: const Icon(Icons.search, size: 40),
                label: const Text(' Buscar  '),
              ),
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        ]),
      ),
      color: Color.fromRGBO(67, 25, 161, 3.90),
    );
  }
}
