import 'package:flutter/material.dart';
import 'controller/selection_globe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const List<List<String>> listOfDetails = [
    ['3001', '3023', '87087', '3040', '60478', '4519', '2453a', '2453b', '2453', '6111', '6112', '2465'],
    ['36841', '36840', '79389', '73825', '99781', '99780', '2436', '2436b', '28802', '44728', '99207'],
    ['2453a', '2453b', '2453', '6111', '6112', '2465', '2436', '2436b', '28802', '44728', '99207']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection Sphere'),
      ),
      body: Center(
        child: SelectionGlobe(listOfDetails: listOfDetails),
      ),
    );
  }
}


