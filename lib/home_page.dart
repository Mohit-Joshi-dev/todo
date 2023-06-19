import 'package:flutter/material.dart';
import 'package:collection/src/iterable_extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              addTodo(value);
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _todos.length,
            itemBuilder: (context, index) {
              final todo = _todos[index];
              return ListTile(
                title: Text(
                  todo.title,
                  style: TextStyle(
                    decoration:
                        todo.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) {
                    taskCompleted(todo, value ?? false);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  final List<Todo> _todos = [];

  void addTodo(String text) {
    _todos.insert(0, Todo(title: text));
    setState(() {});
  }

  void taskCompleted(Todo todo, bool value) {
    if (!value) {
      final temp = _todos.lastWhereOrNull(
        (element) => !element.isCompleted,
      );

      if (temp == null) {
        _todos.remove(todo);
        _todos.insert(0, todo);
      } else {
        final index = _todos.indexOf(temp);
        _todos.remove(todo);
        _todos.insert(index + 1, todo);
      }
    } else {
      if (_todos.contains(todo)) {
        _todos.remove(todo);
        _todos.add(todo);
      }
    }

    todo.isCompleted = value;

    setState(() {});
  }
}

class Todo {
  final String title;
  bool isCompleted;

  Todo({required this.title, this.isCompleted = false});
}
