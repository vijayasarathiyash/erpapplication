import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedLeaveBox extends StatefulWidget {
  final List<String> names;

  const AnimatedLeaveBox({super.key, required this.names});

  @override
  State<AnimatedLeaveBox> createState() => _AnimatedLeaveBoxState();
}

class _AnimatedLeaveBoxState extends State<AnimatedLeaveBox> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    if (widget.names.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 2), (_) {
        _currentIndex = (_currentIndex + 1) % widget.names.length;

        _controller.animateToPage(
          _currentIndex,
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
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade300, Colors.orange.shade600],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.beach_access, color: Colors.white, size: 28),
          const SizedBox(width: 12),

          /// Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'On Leave Today',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),

                SizedBox(
                  height: 24,
                  child: widget.names.length == 1
                      ? Text(
                          widget.names.first,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : PageView.builder(
                          controller: _controller,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.names.length,
                          itemBuilder: (_, index) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.names[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
