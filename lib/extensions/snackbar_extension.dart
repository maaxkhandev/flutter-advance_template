// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

extension SnackbarExtension on BuildContext {
  void showCustomSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 8),
    double fontSize = 16.0,
    Color? textColor,
    Color? backgroundColor,
    String dismissLabel = 'Dismiss',
    Color? dismissTextColor,
  }) {
    final snackBar = SnackBar(
      duration: duration,
      content: Text(
        message,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor ?? Colors.white,
        ),
      ),
      backgroundColor: backgroundColor ?? Colors.blue[300],
      behavior: SnackBarBehavior.fixed,
      action: SnackBarAction(
        label: dismissLabel,
        textColor: dismissTextColor ?? Colors.yellow,
        onPressed: () {
          ScaffoldMessenger.of(this).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  void showCustomMaterialBanner(
    String message, {
    String buttonText = 'Ok',
    Color textColor = Colors.black,
    Color backgroundColor = Colors.white,
  }) {
    try {
      ScaffoldMessenger.of(this).showMaterialBanner(
        MaterialBanner(
          backgroundColor: backgroundColor,
          content: Text(
            message,
            style: TextStyle(color: textColor),
          ),
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(this).hideCurrentMaterialBanner();
              },
              child: Text(
                buttonText,
                style: TextStyle(color: textColor),
              ),
            ),
          ],
        ),
      );
    } catch (e) {
      debugPrint("Error displaying Material Banner: $e");
    }
  }
}

// class Example extends StatelessWidget {
//   const Example({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ElevatedButton(
//       onPressed: () {
//         context.showCustomSnackBar('message');
//       },
//       child: const Text('press me'),
//     ));
//   }
// }
