import 'package:sqflite/sqflite.dart';

import '../models/todo.dart';

class TodoService {
  static List<Todo> todos = [];

  static List<Todo> getTodos() {
    if (todos.isEmpty) {
      todos.add(
        Todo(
            id: 1,
            title: "Kitap Oku",
            description: "En az 50 sayfa",
            isDone: false),
      );

      todos.add(
        Todo(
            id: 2,
            title: "Spor Yap",
            description: "En az 2 saat",
            isDone: false),
      );
      todos.add(
        Todo(
            id: 3,
            title: "Yüzme kursu",
            description: "Saat 2 de",
            isDone: true),
      );
      todos.add(
        Todo(
          id: 3,
          title: "Koş",
          description: "2 Saat",
          isDone: true,
        ),
      );
    }
    return todos.where((element) => !element.isDone!).toList();
  }

  static List<Todo> getDoneTodos() {
    return todos.where((element) => element.isDone!).toList();
  }
}
