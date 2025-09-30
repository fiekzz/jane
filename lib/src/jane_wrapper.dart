import 'package:flutter/material.dart';
import 'package:jane/src/jane_controller.dart';
import 'package:jane/src/jane_page.dart';

import 'dismiss_keyboard.dart';

class JaneWrapper extends StatefulWidget {
  final PIPViewCorner initialCorner;
  final double? floatingWidth;
  final double? floatingHeight;
  final bool avoidKeyboard;

  final Widget Function(BuildContext context) builder;

  final Widget janeContent;

  const JaneWrapper({
    super.key,
    required this.builder,
    required this.janeContent,
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => JanePage(janePager: widget.janeContent),
      ),
    );
  }

  final Size buttonDimension = Size(30, 30);

  @override
  Widget build(BuildContext context) {
    return JaneController(
      avoidKeyboard: widget.avoidKeyboard,
      bottomWidget: _bottomWidget,
      onTapTopWidget: _openContent,
      topWidget: IgnorePointer(
        ignoring: false,
        child: Center(
          child: Icon(Icons.bug_report, color: Colors.red, size: 30),
        ),
      ),
      floatingHeight: buttonDimension.height,
      floatingWidth: buttonDimension.width,
      initialCorner: widget.initialCorner,
    );
  }
}
