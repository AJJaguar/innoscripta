class BoardListObject {
  String title;
  List<BoardItemObject>? items;

  BoardListObject({required this.title, this.items});
}

class BoardItemObject {
  String title;
  String from;
  BoardItemObject({this.title = "", this.from = ""});
}
