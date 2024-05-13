import 'package:flutter/material.dart';

extension BuildContextExtension<T> on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorsScheme => theme.colorScheme;

  double get height => MediaQuery.of(this).size.width;
  Size get size => MediaQuery.of(this).size;
  bool get isMobile => MediaQuery.of(this).size.width <= 500.0;
  bool get isDesktop => MediaQuery.of(this).size.width >= 1024.0;
  bool get isTablet =>
      MediaQuery.of(this).size.width < 1024.0 &&
      MediaQuery.of(this).size.width >= 650.0;
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}

extension ColorExtensions on Color {
  String toHexString({bool includeAlpha = true}) {
    String hexString = value.toRadixString(16).padLeft(8, '0').toUpperCase();
    if (!includeAlpha) {
      hexString = hexString.substring(2);
    }
    return '#$hexString';
  }
}

extension EmptySpace on num {
  SizedBox get height => SizedBox(
        height: toDouble(),
      );
  SizedBox get width => SizedBox(
        height: toDouble(),
      );
  EdgeInsets get top {
    return EdgeInsets.only(top: toDouble());
  }

  EdgeInsets get bottom {
    return EdgeInsets.only(bottom: toDouble());
  }

  EdgeInsets get left {
    return EdgeInsets.only(left: toDouble());
  }

  EdgeInsets get right {
    return EdgeInsets.only(right: toDouble());
  }

  EdgeInsets get horizontal {
    return EdgeInsets.symmetric(horizontal: toDouble());
  }

  EdgeInsets get verticle {
    return EdgeInsets.symmetric(vertical: toDouble());
  }

  EdgeInsets get all {
    return EdgeInsets.all(toDouble());
  }
}

// class Example extends StatelessWidget {
//   const Example({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Padding(
//       padding: 20.all, //add padding 20 padding to all side of sizedbox
//       child: SizedBox(
//         width: context.width,
//         height: context.height / 2,
//         child: Column(
//           children: [
//             const Text('text 1 '),
//             //vertical spacing 10px
//             10.height,
//             const Text('text 2'),
//             Row(
//               children: [
//                 const Text('text 1 '),
//                 //horizental spacing 10px
//                 10.width,
//                 const Text('text 2'),
//               ],
//             )
//           ],
//         ),
//       ),
//     ));
//   }
// }
