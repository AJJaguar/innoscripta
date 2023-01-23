import 'package:innoscripta/model/board.dart';

void changetime() {
  print(allLists[0].items[0].time);
  // allLists[0].items[0].time = timeTaken.toString();
}

List<DraggableList> allLists = [
  DraggableList(
    header: 'TODO',
    items: [
      DraggableListItem(
        title: 'Audio recording in note',
        startTime: 20,
        endTime: 50,
        info: 'Show audio in a note and playback UI',
      ),
    ],
  ),
  DraggableList(
    header: 'IN PROGRESS',
    items: [
      DraggableListItem(
        title: 'Bookmark in note',
        info: 'Show rich link UI in a note',
        startTime: 0,
        endTime: 50,
        currentState: CurrentState.inprogress,
      ),
      DraggableListItem(
          title: 'Star in note',
          startTime: 4,
          endTime: 50,
          info: 'Show rich link UI in a note',
          currentState: CurrentState.inprogress),
    ],
  ),
  DraggableList(
    header: 'DONE',
    items: [
      DraggableListItem(
        title: 'Image viewer',
        startTime: 4,
        endTime: 50,
        info: 'Opens when clicking on the thumbnail',
      ),
    ],
  ),
];
