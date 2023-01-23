import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:innoscripta/data/draggable_lists.dart';
import 'package:innoscripta/widgets/timer_class_widget.dart';
import 'package:innoscripta/model/board.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<DragAndDropList> lists;

  @override
  void initState() {
    super.initState();

    lists = allLists.map(buildList).toList();
  }

  int timeTaken = 0;

  var drag = DraggableListItem(
      title: 'Star in note',
      info: 'Show rich link UI in a note',
      time: 10,
      currentState: CurrentState.inprogress);

  void _startCountDown() {
    setState(() {
      // drag.statess.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // _startCountDown();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Innoscripta'),
      ),
      body: Column(children: [
        Expanded(
          child: DragAndDropLists(
              onItemReorder: onReorderListItem,
              onListReorder: onReorderList,
              children: lists),
        ),
        // SizedBox(
        //   height: 100,
        //   child: Text(
        //     drag.statess.toString(),
        //   ),
        // ),
      ]),
    );
  }

  DragAndDropList buildList(DraggableList list) {
    return DragAndDropList(
      // horizontalAlignment: MainAxisAlignment.spaceAround,
      header: Container(
          color: Colors.red,
          padding: const EdgeInsets.all(8),
          child: Text(list.header)),
      children: list.items
          .map(
            (item) => DragAndDropItem(
              child: GestureDetector(
                onLongPress: () {
                  print('yes');
                },
                child: ListTile(
                  // tileColor: Colors.blue,
                  title: Text(item.title),
                  subtitle: Text(item.info),
                  trailing: TimerWidget(
                    item: item,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      final oldListItems = lists[oldListIndex].children;
      final newListItems = lists[newListIndex].children;

      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListItems.insert(newItemIndex, movedItem);

      // allLists[0].items[0].time = timeTaken.toString();
      // print(allLists);
      changetime();
      _startCountDown();
      print(allLists[0].items[0].time);
      print(timeTaken.toString());
    });
  }

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {}
}
