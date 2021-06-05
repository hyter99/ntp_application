import 'package:flutter/material.dart';
import 'homeController.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme:ThemeData.dark(),
      home: Homeview(title: 'Where I am, da hell ?!'),
    );
  }
}

class Homeview extends StatefulWidget {
  final String title;

  Homeview({required this.title});

  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getCountry();
        },
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
