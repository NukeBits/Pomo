import 'home_page.dart' show HomePage;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium:TextStyle(
            fontSize: 17,
            color   : Colors.white,

          ),
        )
      ),
      home: HomePage(),
    );
  }
}

