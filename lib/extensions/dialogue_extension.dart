import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

extension DialogExt on BuildContext {
  void showAlertDialog({
    required String title,
    required String message,
    List<String>? positiveButtonsTitle,
    String? cancelButtonTitle,
    Function(int)? onDone,
    Color? positiveTitleColor,
    Color? cancelTitleColor,
    double? fontSize,
    bool barrierDismissible = true,
  }) {
    if (Platform.isIOS) {
      _showIOSDialog(
        title,
        message,
        positiveButtonsTitle,
        cancelButtonTitle,
        onDone,
        positiveTitleColor,
        cancelTitleColor,
        fontSize,
        barrierDismissible,
      );
    } else {
      _showAndroidDialog(
        title,
        message,
        positiveButtonsTitle,
        cancelButtonTitle,
        onDone,
        positiveTitleColor,
        cancelTitleColor,
        fontSize,
        barrierDismissible,
      );
    }
  }

  void _showAndroidDialog(
      String title,
      String message,
      List<String>? buttons,
      String? cancelButton,
      Function(int)? onDone,
      Color? positiveTitleColor,
      Color? cancelTitleColor,
      double? fontSize,
      bool barrierDismissible) {
    List<Widget> arrWidget = [];

    if (cancelButton != null) {
      TextButton action = TextButton(
        style: TextButton.styleFrom(
          foregroundColor: cancelTitleColor ?? Colors.black,
          textStyle: TextStyle(
            fontSize: fontSize ?? 16,
          ),
        ),
        child: Text(cancelButton),
        onPressed: () => Navigator.pop(this),
      );
      arrWidget.add(action);
    }

    if (buttons != null) {
      for (String buttonTitle in buttons) {
        TextButton action = TextButton(
          style: TextButton.styleFrom(
            foregroundColor: positiveTitleColor ?? Colors.blue,
            textStyle: TextStyle(
              fontSize: fontSize ?? 16,
            ),
          ),
          child: Text(buttonTitle),
          onPressed: () {
            int index = buttons.indexOf(buttonTitle);
            if (onDone != null) {
              onDone(index);
            }
            Navigator.pop(this);
          },
        );
        arrWidget.add(action);
      }
    }

    showDialog(
        barrierDismissible: barrierDismissible,
        context: this,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(title),
            content: Text(message),
            actions: arrWidget,
          );
        });
  }

  void _showIOSDialog(
      String title,
      String message,
      List<String>? buttons,
      String? cancelButton,
      Function(int)? onDone,
      Color? positiveTitleColor,
      Color? cancelTitleColor,
      double? fontSize,
      bool barrierDismissible) {
    List<Widget> arrWidget = [];

    if (cancelButton != null) {
      CupertinoDialogAction action = CupertinoDialogAction(
        isDefaultAction: true,
        textStyle: TextStyle(
            color: cancelTitleColor ?? Colors.black, fontSize: fontSize ?? 16),
        onPressed: () => Navigator.pop(this),
        child: Text(cancelButton),
      );
      arrWidget.add(action);
    }

    if (buttons != null) {
      for (String buttonTitle in buttons) {
        CupertinoDialogAction action = CupertinoDialogAction(
          isDefaultAction: true,
          textStyle: TextStyle(
              color: positiveTitleColor ?? Colors.blue,
              fontSize: fontSize ?? 16),
          onPressed: () {
            int index = buttons.indexOf(buttonTitle);
            if (onDone != null) {
              onDone(index);
            }
            Navigator.pop(this);
          },
          child: Text(buttonTitle),
        );
        arrWidget.add(action);
      }
    }

    showDialog(
        barrierDismissible: barrierDismissible,
        context: this,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: arrWidget,
          );
        });
  }
}

// class Example extends StatelessWidget {
//   const Example({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ElevatedButton(
//       onPressed: () {
//         context.showAlertDialog(title: 'title', message: 'message');
//       },
//       child: const Text('press me'),
//     ));
//   }
// }
