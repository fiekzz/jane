import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JanePage extends StatefulWidget {
  const JanePage({super.key, required this.janePager});

  final Widget janePager;

  @override
  State<JanePage> createState() => _JanePageState();
}

class _JanePageState extends State<JanePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: widget.janePager);
  }
}
