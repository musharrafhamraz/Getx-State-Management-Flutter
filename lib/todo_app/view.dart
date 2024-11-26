import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstatepractice/todo_app/controller.dart';

class TodoApp extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());
  final TextEditingController text = TextEditingController();

  TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Todo App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: todoController.todos.length,
                itemBuilder: (context, index) {
                  var todo = todoController.todos[index];
                  return ListTile(
                    title: Text(
                      todo.task,
                      style: TextStyle(
                        decoration: todo.isComplete
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    leading: Checkbox(
                      value: todo.isComplete,
                      onChanged: (value) {
                        todoController.toggleTodoStatus(index);
                      },
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        todoController.removeTask(index);
                      },
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: text,
                    decoration: const InputDecoration(
                      labelText: 'Add Todo',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        todoController.addTodo(value);
                        value = '';
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle add todo action
                    if (text.text.isNotEmpty) {
                      todoController.addTodo(text.text);
                      text.text = '';
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
