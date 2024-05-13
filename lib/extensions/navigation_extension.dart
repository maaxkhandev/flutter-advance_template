import 'package:flutter/material.dart';

extension NavigatorExt on BuildContext {
  Object? get routeArguments => ModalRoute.of(this)?.settings.arguments;

  Object? get routeName => ModalRoute.of(this)?.settings.name;

  Object? get routeSettings => ModalRoute.of(this)?.settings;

  bool canPop() => Navigator.canPop(this);

  void pop<T>({T? result}) => Navigator.pop(this, result);

  void popUntil(
    String screenName, {
    bool rootNavigator = false,
  }) =>
      Navigator.of(this, rootNavigator: rootNavigator)
          .popUntil(ModalRoute.withName(screenName));

  Future<dynamic> push(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool rootNavigator = false,
  }) async =>
      await Navigator.of(this, rootNavigator: rootNavigator)
          .push(MaterialPageRoute(
        builder: (_) => screen,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      ));

  Future<dynamic> pushAndRemoveUntil(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool Function(Route<dynamic>)? predicate,
    bool rootNavigator = false,
  }) async =>
      await Navigator.of(this, rootNavigator: rootNavigator).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => screen,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        ),
        predicate ?? (Route<dynamic> route) => false,
      );

  Future<dynamic> pushNamed(
    String screenName, {
    Object? arguments,
    bool rootNavigator = false,
  }) async =>
      await Navigator.of(this, rootNavigator: rootNavigator)
          .pushNamed(screenName, arguments: arguments);

  Future<dynamic> pushReplacement(
    Widget screen, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool rootNavigator = false,
  }) async =>
      await Navigator.of(this, rootNavigator: rootNavigator)
          .pushReplacement(MaterialPageRoute(
        builder: (_) => screen,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      ));

  Future<dynamic> pushReplacementNamed(
    String screenName, {
    Object? arguments,
    bool rootNavigator = false,
  }) async =>
      Navigator.of(this, rootNavigator: rootNavigator)
          .pushReplacementNamed(screenName, arguments: arguments);
}


// class Example extends StatelessWidget {
//   const Example({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ElevatedButton(
//       onPressed: () {
//         context.push(const HomeScreen());
//       },
//       child: const Text('press me'),
//     ));
//   }
// }

