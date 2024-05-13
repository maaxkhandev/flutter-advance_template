import 'package:flutter/material.dart';
import 'package:flutter_advance_template/config/routes.dart';
import 'package:flutter_advance_template/config/theme.dart';
import 'package:flutter_advance_template/view/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Advance Template',
      routes: getRoutes(context),
      initialRoute: HomeScreen.routeName,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
    );
  }
}
