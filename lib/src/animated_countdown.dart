import 'dart:async';

import 'package:flutter/material.dart';

/// [totalDuration] total duration / total steps in seconds
/// [maxTextSize] initial text size at 0s
/// [minTextSize] text size after 1 second
/// [textStyle] style of the displayed value text
/// [onEnd] called at the end of the count down
class CountDownWidget extends StatefulWidget {
  const CountDownWidget({
    Key? key,
    this.onEnd,
    this.totalDuration = 3,
    this.maxTextSize = 100,
    this.minTextSize = 10,
    this.textStyle = const TextStyle(),
  })  : assert(totalDuration > 1),
        super(key: key);

  final Function()? onEnd;
  final double maxTextSize;
  final double minTextSize;
  final int totalDuration;
  final TextStyle textStyle;

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  Timer? timer;

  // current value to be displayed
  int value = 3;
  bool finished = false;

  @override
  void initState() {
    value = widget.totalDuration;
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (value == 1) {
        setState(() {
          timer.cancel();
          widget.onEnd?.call();
          finished = true;
        });

        return;
      }
      if (mounted) {
        setState(() {
          value--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (finished) {
      return const SizedBox(
        key: Key('CountDownValueHidden'),
      );
    }
    return _CountDown(
      key: Key(value.toString()),
      value: value,
      textStyle: widget.textStyle,
      maxTextSize: widget.maxTextSize,
      minTextSize: widget.minTextSize,
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}

class _CountDown extends StatefulWidget {
  const _CountDown({
    Key? key,
    required this.value,
    this.maxTextSize = 100,
    this.minTextSize = 10,
    this.textStyle = const TextStyle(),
  }) : super(key: key);

  final int value;
  final TextStyle textStyle;
  final double maxTextSize;
  final double minTextSize;

  @override
  State<_CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<_CountDown> {
  var _size = 100.0;
  Timer? timer;

  @override
  void initState() {
    _size = widget.maxTextSize;
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      setState(() {
        _size = widget.minTextSize;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: _size == widget.maxTextSize
          ? Duration.zero
          : const Duration(
              seconds: 1,
            ),
      style: widget.textStyle.copyWith(
        fontSize: _size,
      ),
      child: Text(
        widget.value.toString(),
        key: const Key('CountDownValue'),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
