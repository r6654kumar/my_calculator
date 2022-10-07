import 'package:flutter/material.dart';
import 'package:my_calculator/pages/homepage.dart';
void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	debugShowCheckedModeBanner: false,
  theme: ThemeData(
    primarySwatch: Colors.purple,
    brightness: Brightness.light
  ),
  darkTheme: ThemeData(
    brightness: Brightness.dark
  ),
  themeMode: ThemeMode.system,
	home: HomePage(),
	); // MaterialApp
}
}

