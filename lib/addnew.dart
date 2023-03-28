import 'package:flutter/material.dart';
import 'package:todolist_app/item_model.dart';

class AddNew extends StatefulWidget {
  final Item itemDetails;
  const AddNew({super.key, required this.itemDetails});

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  final itemList = Item.itemList();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.itemDetails.itemText!;
    descriptionController.text = widget.itemDetails.itemSub!;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            elevation: 0,
            title: const Text("Details")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.maxFinite,
                height: 10,
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14)))),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      "To-Do Title:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    controller: titleController,
                    readOnly: true,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8)),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 12),
                    child: Text(
                      "Description:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      controller: descriptionController,
                      readOnly: true,
                      minLines: null,
                      maxLines: null,
                      expands: true,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
