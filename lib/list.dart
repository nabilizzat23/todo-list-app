import 'package:flutter/material.dart';
import 'package:todolist_app/addnew.dart';
import 'package:todolist_app/item_model.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final itemList = Item.itemList();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Todo List",
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 28, 20),
                child: Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          context: context, builder: (context) => newItem());
                    },
                    child: Text("Add New", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue[900])),
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: itemList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => AddNew(
                                                      itemDetails:
                                                          itemList[index])));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(color: const Color(0xFFf2f2f2), borderRadius: BorderRadius.circular(8)),
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 4,
                                                    horizontal: 12),
                                            title: Text(
                                              itemList[index].itemText,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold, fontSize: 17,
                                                  decoration:
                                                      itemList[index].isDone
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : null),
                                            ),
                                            subtitle: Text(
                                                itemList[index].itemSub ?? '', 
                                              overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 15, decoration:
                                                      itemList[index].isDone
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : null),),
                                            trailing: IconButton(
                                                onPressed: () {
                                                  deleteItem(
                                                      itemList[index].id);
                                                },
                                                icon: const Icon(
                                                  Icons.delete_rounded,
                                                  color: Color.fromARGB(255, 180, 27, 16),
                                                  size: 26,
                                                )),
                                            leading: Checkbox(
                                              activeColor: Colors.blue[900],
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                                value: itemList[index].isDone,
                                                onChanged: (value) {
                                                  setState(() {
                                                    itemList[index].isDone =
                                                        !itemList[index].isDone;
                                                  });
                                                }),
                                          ),
                                        ),
                                      ));
                                })),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addItem(String title, desc) {
    setState(() {
      itemList.add(Item(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          itemText: title,
          itemSub: desc));
    });
  }

  void deleteItem(String id) {
    setState(() {
      itemList.removeWhere((item) => item.id == id);
    });
  }

  Widget newItem() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                "To-Do Title",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            TextFormField(
              controller: titleController,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  hintText: "Enter your To-Do title here",
                  hintStyle: TextStyle(fontStyle: FontStyle.italic)),
              onTap: () {},
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 12, top: 22),
              child: Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
                  SizedBox(
                    height: 150,
                    child: TextFormField(
                      controller: descriptionController,
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          hintText: "Enter the description here",
                          hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                      onTap: () {},
                    ),
                  ),
            Container(
              alignment: Alignment.centerRight,
              child: Container(
                width: 110,
                height: 50,
                decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(12)),
                margin: const EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () {
                    addItem(titleController.text, descriptionController.text);
              
                    titleController.clear();
                    descriptionController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text("Save", style: TextStyle(fontSize: 16 ,color: Colors.white),),
                ),
              ),
            )
          ],
        ),
      );
}
