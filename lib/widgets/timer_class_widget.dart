import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../model/board.dart';

class TimerWidget extends StatefulWidget {
  final DraggableListItem? item;
  const TimerWidget({super.key, this.item});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final ValueNotifier time = ValueNotifier<int>(0);

  int _startTimer(int currTime) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      currTime++;
      time.value = currTime;
      if (widget.item!.currentState != CurrentState.inprogress) timer.cancel();
      if (currTime == widget.item!.endTime) timer.cancel();
    });
    return currTime;
  }

  @override
  void initState() {
    _startTimer(widget.item!.startTime);
    super.initState();
  }

  @override
  dispose() {
    time.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: time,
        builder: (context, value, child) {
          return Text(value.toString());
        });
  }
}
