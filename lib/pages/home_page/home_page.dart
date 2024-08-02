import 'package:flutter/material.dart';
import 'package:map_page/pages/main_page/main_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                /// navigating to Sell Produce page, i have given name MainPage for that
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ));
              },
              child: const Text("Add My Produce"),
            )
          ],
        ),
      ),
    );
  }
}
