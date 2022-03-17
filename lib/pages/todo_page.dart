import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleFiled = TextFormField(
        decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
    ));

    final descriptionFiled = TextFormField(
        maxLines: 5,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ));

    final saveButton = FlatButton(
      onPressed: () {},
      child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("New To do"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: titleFiled,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: descriptionFiled,
            ),
            saveButton,
          ],
        ));
  }
}
