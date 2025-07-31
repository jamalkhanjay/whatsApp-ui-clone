import 'package:flutter/material.dart';

// class AppTextStyles extends TextStyle {
//   static TextStyle mainTitle = TextStyle(
//     fontWeight: FontWeight.bold,
//     // color: Theme.of(context).colorScheme.primary,
//     color: Theme.of(context).colorScheme.onPrimary,
//   );
// }

// implementing with extention
extension AppTextStyle on BuildContext {
  TextStyle get getTitle => TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Theme.of(this).colorScheme.primary,
  );

  TextStyle get getOtherTitles =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
}
