import 'package:flutter/cupertino.dart';

class SizePresets {
  BuildContext context;

  SizePresets({required this.context});

  /// Uses MediaQuery to give you an adaptable custom height
  double customHeight(double divider) =>
      MediaQuery.of(context).size.height / divider;

  double customPaddingTop(double divider) =>
      MediaQuery.of(context).padding.top / divider;

  /// Uses MediaQuery to give you an adaptable custom width
  double customWidth(double divider) =>
      MediaQuery.of(context).size.width / divider;
}
