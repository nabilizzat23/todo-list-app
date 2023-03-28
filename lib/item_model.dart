class Item {
  String? id;
  String? itemText;
  String? itemSub;
  bool isDone;

  Item({
    required this.id,
    required this.itemText,
    required this.itemSub,
    this.isDone = false,
  });

  static List<dynamic> itemList() {
    return [
      Item(id: '01', itemText: 'Create calculator', itemSub: 'Simple one page calculator, dark theme', isDone: true),
      Item(id: '02', itemText: 'Create todo apps',itemSub: '', isDone: true),
      Item(id: '03', itemText: 'Buy groceries', itemSub: ''),
      Item(id: '04', itemText: 'Cook dinner', itemSub: 'Defroze chicken 2 hour early'),
      Item(id: '05', itemText: 'Create list', itemSub: 'Create list using listview and list tile is required to be rounded corner and theme is blue and white'),
    ];
  }
}
