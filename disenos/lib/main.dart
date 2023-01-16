import 'package:disenos/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const BasicDesignScreen(),
        initialRoute: 'home_design',
        theme: ThemeData.dark(),
        routes: {
          'basic_design': (_) => const BasicDesignScreen(),
          'scroll_design': (_) => const ScrollScreen(),
          'home_design': (_) => const HomeScreen(),
        });
  }
}
