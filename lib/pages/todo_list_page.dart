import 'package:flutter/material.dart';
import 'package:todo_app/data/todo_service.dart';
import 'package:todo_app/pages/todo_page.dart';

import '../models/todo.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Todo> todos = [];
  List<Todo> doneTodos = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("To Do"),
        bottom: const TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.check_box_outline_blank),
            ),
            Tab(
              icon: Icon(Icons.check),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          getTodoList(todos),
          getTodoList(doneTodos),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TodoPage(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget getTodoList(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text((todos[index].title).toString()),
            subtitle: Text((todos[index].description.su).toString()),
            trailing: Checkbox(
              onChanged: (value) {
                setState(() {
                  todos[index].isDone = value;
                });
              },
              value: todos[index].isDone,
            ),
          ),
        );
      },
    );
  }

  loadData() {
    setState(() {
      todos = TodoService.getTodos();
      doneTodos = TodoService.getDoneTodos();
    });
  }
}
