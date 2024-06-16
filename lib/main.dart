import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Growing and Shrinking Circle')),
        body: Center(
          child: GrowingShrinkingCircle(),
        ),
      ),
    );
  }
}

class GrowingShrinkingCircle extends StatefulWidget {
  @override
  _GrowingShrinkingCircleState createState() => _GrowingShrinkingCircleState();
}

class _GrowingShrinkingCircleState extends State<GrowingShrinkingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 100 + _animation.value * 100,
          height: 100 + _animation.value * 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
        );
      },
    );
  }
}
