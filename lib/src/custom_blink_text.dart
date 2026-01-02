import 'package:flutter/cupertino.dart';

class CustomBlinkText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final double minOpacity;
  final Duration duration;

  const CustomBlinkText({
    required this.text,
    required this.style,
    this.minOpacity = 0.2,
    this.duration = const Duration(milliseconds: 500),
    Key? key,
  }) : super(key: key);

  @override
  _CustomBlinkTextState createState() => _CustomBlinkTextState();
}

class _CustomBlinkTextState extends State<CustomBlinkText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: widget.minOpacity,
      end: 1.0,
    ).animate(_controller);
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
        return Opacity(
          opacity: _animation.value,
          child: Text(
            widget.text,
            style: widget.style,
          ),
        );
      },
    );
  }
}