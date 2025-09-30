import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jane/src/jane_controller.dart';

import 'dismiss_keyboard.dart';

class JaneWrapper extends StatefulWidget {
  final PIPViewCorner initialCorner;
  final double? floatingWidth;
  final double? floatingHeight;
  final bool avoidKeyboard;

  final Function contentNavigator;

  final Widget Function(BuildContext context) builder;

  // final Widget janeContent;

  const JaneWrapper({
    super.key,
    required this.builder,
    // required this.janeContent,
    required this.contentNavigator,
    this.initialCorner = PIPViewCorner.topRight,
    this.floatingWidth,
    this.floatingHeight,
    this.avoidKeyboard = true,
  });

  @override
  JaneWrapperState createState() => JaneWrapperState();
}

class JaneWrapperState extends State<JaneWrapper>
    with TickerProviderStateMixin {
  Widget? _bottomWidget;

  void _presentBelow() {
    dismissKeyboard(context);
    setState(() => _bottomWidget = widget.builder(context));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _presentBelow();
  }

  void _openContent() {
    dismissKeyboard(context);

    widget.contentNavigator();
  }

  final Size buttonDimension = Size(30, 30);

  @override
  Widget build(BuildContext context) {
    return JaneController(
      avoidKeyboard: widget.avoidKeyboard,
      bottomWidget: _bottomWidget,
      onTapTopWidget: _openContent,
      topWidget: kDebugMode
          ? IgnorePointer(
              ignoring: false,
              child: Center(
                child: Icon(Icons.bug_report, color: Colors.red, size: 30),
              ),
            )
          : null,
      floatingHeight: buttonDimension.height,
      floatingWidth: buttonDimension.width,
      initialCorner: widget.initialCorner,
    );
  }
}
