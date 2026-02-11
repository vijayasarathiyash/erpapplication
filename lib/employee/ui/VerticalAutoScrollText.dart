import 'dart:async';
import 'package:flutter/material.dart';

class VerticalAutoScrollText extends StatefulWidget {
  final List<String> items;
  final TextStyle textStyle;

  const VerticalAutoScrollText({
    super.key,
    required this.items,
    required this.textStyle,
  });

  @override
  State<VerticalAutoScrollText> createState() => _VerticalAutoScrollTextState();
}

class _VerticalAutoScrollTextState extends State<VerticalAutoScrollText> {
  final PageController _controller = PageController();
  Timer? _timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();

    if (widget.items.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 2), (_) {
        _index = (_index + 1) % widget.items.length;
        _controller.animateToPage(
          _index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: widget.items.length == 1
          ? Text(widget.items.first, style: widget.textStyle)
          : PageView.builder(
              controller: _controller,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.items.length,
              itemBuilder: (_, index) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.items[index], style: widget.textStyle),
                );
              },
            ),
    );
  }
}
