import 'package:flutter/cupertino.dart';

class SizePresets extends InheritedWidget {
  final Widget child;

  const SizePresets({super.key, required this.child}) : super(child: child);

  /// Uses MediaQuery to give you an adaptable custom height
  double customHeight(double divider, BuildContext context) =>
      MediaQuery.of(context).size.height / divider;

  double customPaddingTop(double divider, BuildContext context) =>
      MediaQuery.of(context).padding.top / divider;

  /// Uses MediaQuery to give you an adaptable custom width
  double customWidth(double divider, BuildContext context) =>
      MediaQuery.of(context).size.width / divider;


  static SizePresets of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<SizePresets>())
          as SizePresets;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return this == oldWidget;
  }
}
