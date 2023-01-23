import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:flutter/material.dart';
import 'package:innoscripta/draggable/dashboard.dart';
import 'package:innoscripta/model/board.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Home(),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: BoardViewExample(),
//     );
//   }
// }

// class BoardViewExample extends StatelessWidget {
//   BoardViewExample({super.key});
//   final List<BoardListObject> _listData = [
//     BoardListObject(title: 'Pedidos nuevos', items: [
//       BoardItemObject(
//           title: 'for sfdsfdfsjfl ff-sfisfdslfjsdf sfs fs', from: 'Ruben'),
//       BoardItemObject(
//           title: 'for sfdsfdfsjfl  I alove football for  no reason',
//           from: 'Fadil'),
//     ]),
//     BoardListObject(
//       title: '2nd board',
//     ),
//     BoardListObject(
//       title: '3rd board',
//     ),
//     BoardListObject(
//       title: '4th board',
//     )
//   ];

//   final BoardViewController boardViewController = BoardViewController();
//   @override
//   Widget build(BuildContext context) {
//     List<BoardList> lists = <BoardList>[];
//     for (int i = 0; i < _listData.length; i++) {
//       lists.add(_createBoardList(_listData[i]) as BoardList);
//     }
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: BoardView(
//         lists: lists,
//         boardViewController: boardViewController,
//       ),
//     );
//   }

//   Widget _createBoardList(BoardListObject list) {
//     List<BoardItem> items = [];
//     if (items.isNotEmpty) {
//       for (int i = 0; i < list.items!.length; i++) {
//         items.insert(i, buildBoardItem(list.items![i]) as BoardItem);
//       }
//     }

//     return BoardList(
//       onStartDragList: ((listIndex) {}),
//       onDropList: ((listIndex, oldListIndex) {
//         var list = _listData[oldListIndex!];
//         _listData.removeAt(oldListIndex);
//         _listData.insert(listIndex!, list);
//       }),
//       onTapList: (listIndex) async {},
//       headerBackgroundColor: Color.fromARGB(255, 235, 236, 240),
//       backgroundColor: Color.fromARGB(255, 235, 236, 240),
//       header: [
//         Expanded(
//           child: Container(
//             padding: EdgeInsets.all(10),
//             child: Text(
//               list.title,
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//         ),
//       ],
//       items: items,
//     );
//   }

//   Widget buildBoardItem(BoardItemObject itemObject) {
//     return BoardItem(
//       onStartDragItem:
//           (int? listIndex, int? itemIndex, BoardItemState? state) {},
//       onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
//           int? oldItemIndex, BoardItemState? state) {
//         var item = _listData[oldListIndex!].items![oldItemIndex!];
//         _listData[oldListIndex].items!.removeAt(oldItemIndex);
//         _listData[listIndex!].items!.insert(itemIndex!, item);
//       },
//       onTapItem:
//           (int? listIndex, int? itemIndex, BoardItemState? state) async {},
//       item: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Text(
//                 itemObject.from,
//                 style: const TextStyle(
//                     height: 1.5,
//                     color: Color(0xff2F334B),
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 itemObject.title,
//                 style: const TextStyle(
//                     height: 1.5,
//                     color: Color(0xff2F334B),
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:awesome_board/models/board.dart';
// import 'package:awesome_board/provider/provider.dart';
import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Awesome Board',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage());
  }
}

// class Home extends StatefulWidget {
//   Home({key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xffffffff),
//         elevation: 0,
//         title: Row(
//           children: <Widget>[
//             Icon(
//               Icons.view_column,
//               color: Color(0xff2F334B),
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Text(
//               'Pedidos',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold, color: Color(0xff2F334B)),
//             ),
//           ],
//         ),
//         bottom: PreferredSize(
//             child: Container(
//               color: Colors.grey[300],
//               height: 1.0,
//             ),
//             preferredSize: Size.fromHeight(1.0)),
//       ),
//       body: BoardViewExample(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Add your onPressed code here!
//         },
//         child: Icon(Icons.navigation),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }
// }

// class BoardViewExample extends StatelessWidget {
//   final List<BoardListObject> _listData = [
//     BoardListObject(title: "Pedidos nuevos", items: [
//       BoardItemObject(
//           title: '27 Pares de Zapatos Modelo SDF-234d', from: 'Ruben'),
//       BoardItemObject(title: '7 Pares de Bota Modelo SDF-234d', from: 'Martha')
//     ]),
//     BoardListObject(title: "En Proceso", items: [
//       BoardItemObject(
//           title: '27 Pares de Zapatos Modelo SDF-234d', from: 'Ruben'),
//       BoardItemObject(title: '7 Pares de Bota Modelo SDF-234d', from: 'Martha')
//     ]),
//     BoardListObject(title: "Enviados", items: [
//       BoardItemObject(
//           title: '27 Pares de Zapatos Modelo SDF-234d', from: 'Ruben'),
//       BoardItemObject(title: '7 Pares de Bota Modelo SDF-234d', from: 'Martha')
//     ]),
//     BoardListObject(title: "Cancelados", items: [
//       BoardItemObject(
//           title: '27 Pares de Zapatos Modelo SDF-234d', from: 'Ruben'),
//       BoardItemObject(title: '7 Pares de Bota Modelo SDF-234d', from: 'Martha')
//     ]),
//   ];
//   //Can be used to animate to different sections of the BoardView
//   final BoardViewController boardViewController = new BoardViewController();

//   @override
//   Widget build(BuildContext context) {
//     List<BoardList> _lists = <BoardList>[];

//     for (int i = 0; i < _listData.length; i++) {
//       _lists.add(_createBoardList(_listData[i]) as BoardList);
//     }

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: BoardView(
//         lists: _lists,
//         boardViewController: boardViewController,
//       ),
//     );
//   }

//   Widget buildBoardItem(BoardItemObject itemObject) {
//     return BoardItem(
//         onStartDragItem:
//             (int? listIndex, int? itemIndex, BoardItemState state) {},
//         onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
//             int? oldItemIndex, BoardItemState state) {
//           //Used to update our local item data
//           var item = _listData[oldListIndex!].items![oldItemIndex!];

//           _listData[oldListIndex].items?.removeAt(oldItemIndex);

//           _listData[listIndex!].items?.insert(itemIndex!, item);
//         },
//         onTapItem:
//             (int? listIndex, int? itemIndex, BoardItemState state) async {},
//         item: Container(
//           margin: EdgeInsets.fromLTRB(8, 0, 8, 8),
//           child: Card(
//             elevation: 0,
//             child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       itemObject.from,
//                       style: TextStyle(
//                           height: 1.5,
//                           color: Color(0xff2F334B),
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Text(
//                       itemObject.title,
//                       style: TextStyle(
//                           height: 1.5, color: Color(0xff2F334B), fontSize: 16),
//                     ),
//                   ],
//                 )),
//           ),
//         ));
//   }

//   Widget _createBoardList(BoardListObject list) {
//     List<BoardItem> items = [];
//     for (int i = 0; i < list.items!.length; i++) {
//       items.insert(i, buildBoardItem(list.items![i]) as BoardItem);
//     }

//     return BoardList(
//       onStartDragList: (int? listIndex) {},
//       onTapList: (int? listIndex) async {},
//       onDropList: (int? listIndex, int? oldListIndex) {
//         //Update our local list data
//         var list = _listData[oldListIndex!];
//         _listData.removeAt(oldListIndex);
//         _listData.insert(listIndex!, list);
//       },
//       headerBackgroundColor: Colors.transparent,
//       backgroundColor: const Color(0xffECEDFC),
//       header: [
//         Expanded(
//           child: Container(
//             padding: const EdgeInsets.all(10),
//             child: Text(
//               list.title,
//               style: const TextStyle(
//                   fontSize: 23,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xff2F334B)),
//             ),
//           ),
//         ),
//       ],
//       items: items,
//     );
//   }
// }
