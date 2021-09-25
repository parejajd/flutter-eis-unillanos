import 'package:casanareapp/Providers/cities.provider.dart';
import 'package:casanareapp/models/cities.model.dart';
import 'package:casanareapp/pages/site.details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CitiesProvider citiesProvider = CitiesProvider();
  Future<List<Cities>>? listaCities;

  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = false;
  Object? values, values1;

  @override
  void initState() {
    listaCities = citiesProvider.getCities();
    super.initState();
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
                      builder: (context) => DetailsPage(),
                    ),
                  )
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
                      fontSize: 27,
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
                            value: values,
                            onChanged: (newValue) {
                              setState(() {
                                values = newValue;
                              });
                            },
                            iconSize: 36,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Colors.black),
                            isExpanded: true,
                            items: snapshot.data!
                                .map<DropdownMenuItem<String>>((Cities value) {
                              return DropdownMenuItem<String>(
                                value: value.name,
                                child: Text(value.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    )),
                              );
                            }).toList(),
                            dropdownColor: Colors.black54,
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
                    child: DropdownButton(
                      value: values1,
                      onChanged: (newValue1) {
                        setState(() {
                          values1 = newValue1;
                        });
                      },
                      iconSize: 36,
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                      isExpanded: true,
                      items: <String>["Transporte", "compras"]
                          .map<DropdownMenuItem<String>>((String values1) {
                        return DropdownMenuItem<String>(
                          value: values1,
                          child: Text(values1,
                              style: const TextStyle(
                                color: Colors.white,
                              )),
                        );
                      }).toList(),
                      dropdownColor: Colors.black54,
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
                        children: const [
                          TextField(
                            decoration: InputDecoration(
                              hintText: "Palabras Clave de la Busqueda",
                              fillColor: Colors.white,
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
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
                      // Respond to button press
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
}
