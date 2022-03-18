import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_list_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: TodoListPage(),
      ),
    );
  }
}
