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
  int startTime;
  int endTime;
  int currentTime;
  DraggableListItem({
    required this.title,
    required this.info,
    this.time = 8,
    this.startTime = 0,
    this.currentTime = 0,
    this.endTime = 0,
    this.currentState = CurrentState.todo,
  });
}

enum CurrentState {
  todo,
  inprogress,
  done,
}
