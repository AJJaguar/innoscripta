import 'dart:async';

class DraggableList {
  final String header;
  final List<DraggableListItem> items;

  DraggableList({
    required this.header,
    required this.items,
  });
}

class DraggableListItem {
  final String title;
  final String info;
  CurrentState currentState;
  int time;
  DraggableListItem({
    required this.title,
    required this.info,
    this.time = 8,
    this.currentState = CurrentState.todo,
  });

  int _startTimer(int time) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      // setState(() {

      time++;
      print("Time is $time");

      // });
    });
    return time;
  }

  int get statess {
    if (currentState == CurrentState.inprogress) {
      print("In progress");
      time = _startTimer(time);
      return time;
    } else {
      return time;
    }
  }
}

enum CurrentState {
  todo,
  inprogress,
  done,
}
