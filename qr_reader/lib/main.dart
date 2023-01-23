import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.teal;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QR Reader',
          initialRoute: 'home',
          routes: {
            'home': (_) => const HomePage(),
            'mapa': (_) => const MapaPage(),
          },
          theme: ThemeData(
              primaryColorLight: primaryColor,
              primaryColor: primaryColor,
              appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedItemColor: primaryColor),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: primaryColor))),
    );
  }
}
