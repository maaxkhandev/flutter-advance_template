import 'package:flutter/material.dart';

import '../view/screens/home_screen/home_screen.dart';

Map<String, Widget Function(BuildContext)> getRoutes(BuildContext ctx) {
  return {
    HomeScreen.routeName: (ctx) => const HomeScreen(),
  };
}
