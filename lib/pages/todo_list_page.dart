import 'package:flutter/material.dart';
import 'package:todo_app/data/todo_service.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/todo_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TodoService service = TodoService.instance;
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
        title: const Text("To Do"),
        centerTitle: true,
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
          Navigator.push(context, MaterialPageRoute(builder: (_) => TodoPage()))
              .then((value) => loadData());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget getTodoList(List<Todo> todos) {
    return todos.isEmpty
        ? const Center(child: Text('Henüz bir şey yok'))
        : ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(todos[index].title),
                  subtitle: Text(todos[index].description),
                  trailing: Checkbox(
                    onChanged: (value) {
                      todos[index].isDone = value!;
                      service
                          .updateIsDone(todos[index])
                          .then((value) => loadData());
                    },
                    value: todos[index].isDone,
                  ),
                ),
              );
            },
          );
  }

  loadData() {
    service.getTodos(true).then((value) {
      setState(() {
        todos = value;
      });
    });
    service.getTodos(false).then((value) {
      setState(() {
        doneTodos = value;
      });
    });
  }
}
