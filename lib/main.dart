import 'package:flutter/material.dart';

import 'pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Map Page',
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF265B30)),
        primaryColor: const Color(0xFF265B30),
        useMaterial3: true,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              backgroundColor: const Color(0xFF3B5B26),
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              elevation: 8,
              shadowColor: Theme.of(context).shadowColor,
              iconTheme: const IconThemeData(color: Colors.white),
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff638C30),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ))),
      ),
      home: const HomePage(),
    );
  }
}
