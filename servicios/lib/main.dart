import 'package:flutter/material.dart';
import 'package:servicios/services/service1.dart';
import 'package:servicios/services/service2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String randomJoke = "Presiona el botón azul para obtener un chiste";
  String categoryJoke = "Selecciona una categoría y presiona el botón";
  String selectedCategory = 'animal';

  // Lista de categorías
  final List<String> categories = [
    'animal',
    'career',
    'celebrity',
    'dev',
    'food'
  ];

  Future<void> fetchRandomJoke() async {
    try {
      final fetchedJoke = await getApi();
      setState(() {
        randomJoke = fetchedJoke;
      });
    } catch (e) {
      setState(() {
        randomJoke = "Error al obtener el chiste";
      });
    }
  }

  Future<void> fetchCategoryJoke() async {
    try {
      final categoria = await getCategoria(selectedCategory);
      setState(() {
        categoryJoke = categoria;
      });
    } catch (e) {
      setState(() {
        categoryJoke = "Error al obtener el chiste";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(238, 15, 167, 218),
          title: Text(
            "CHISTES DE CHUCK NORRIS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.network(
                    "https://m.media-amazon.com/images/I/51TcGQWXl8L.jpg",
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Chistes Aleatorios",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: fetchRandomJoke,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0)),
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  "Obtener Chiste Aleatorio",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    randomJoke,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 1, 24, 43),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Text(
                "Chistes Por Categoría",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: (String? newCategory) {
                    setState(() {
                      selectedCategory = newCategory!;
                    });
                  },
                  items: categories
                      .map<DropdownMenuItem<String>>((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: fetchCategoryJoke,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  "Obtener Chiste por Categoría",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    categoryJoke,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 1, 24, 43),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
