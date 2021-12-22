import 'package:flutter/material.dart';

part './txt.dart';
part './color_tile.dart';

class FadePageRoute extends PageRouteBuilder {
  final Widget widget;

  FadePageRoute({
    required this.widget,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: ((context, animation, secondaryAnimation, child) {
            return SlideTransition(
              transformHitTests: false,
              position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(animation),
              child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: const Offset(0.0, -1.0),
                  ).animate(secondaryAnimation),
                  child: child),
            );
          }),
        );
}

class Widgets {
  Widgets._privateConstructor();

  static final Widgets _instance = Widgets._privateConstructor();

  static Widgets get instance => _instance;

  static Widget arrow({
    Color? color,
  }) {
    color = color ?? Colors.grey.shade200;
    return Container(
      child: Icon(Icons.chevron_right, size: 18, color: color),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        shape: BoxShape.circle,
      ),
    );
  }

  void push(Widget? child, BuildContext context) {
    if (child != null) {
      Navigator.push(context, FadePageRoute(widget: child));
    } else {
      // showToast("No destination page found", context);
    }
  }
}
