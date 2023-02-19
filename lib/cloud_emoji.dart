import 'dart:math';

import 'package:flutter/material.dart';

class CloudEmoji extends StatelessWidget {
  const CloudEmoji({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return Stack(
      children:
          List.generate(10, (index) => Cloud(heightFraction: -1 + random.nextDouble() * 2, widthFraction: -1 + random.nextDouble() * 2)).toList(),
    );
  }
}

class Cloud extends StatefulWidget {
  final double widthFraction;
  final double heightFraction;

  const Cloud({Key? key, required this.heightFraction, required this.widthFraction}) : super(key: key);

  @override
  State<Cloud> createState() => _CloudState();
}

class _CloudState extends State<Cloud> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(widget.widthFraction, widget.heightFraction),
      end: Offset(-1.0, widget.heightFraction),
    ).animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(widget.widthFraction, widget.heightFraction),
      child: SlideTransition(
        position: _animation,
        child: const Text(
          "☁",
          style: TextStyle(
            fontSize: 64,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
