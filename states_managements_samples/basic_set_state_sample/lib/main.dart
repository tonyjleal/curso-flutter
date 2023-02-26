import 'package:flutter/material.dart';
import 'package:set_state_sample/screens/MyHomePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  @override
  void initState() {
    super.initState();
    counter = counter;
  }

  void _decrementCounter(_) {
    setState(() {
      counter--;
    });
  }

  void _incrementCounter(_) {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'My Home Page',
        counter: counter,
        decrementCounter: _decrementCounter,
        incrementCounter: _incrementCounter,
      ),
    );
  }
}
