import 'package:get/get.dart';
import 'package:getxstatepractice/todo_app/task_model.dart';

class TodoController extends GetxController {
  // list of todos
  var todos = <Todo>[].obs;

  // add task to the list
  void addTodo(String title) {
    todos.add(Todo(task: title));
  }

  // toggle the completion status of the todo
  void toggleTodoStatus(int index) {
    var todo = todos[index];
    todo.isComplete = !todo.isComplete;
    todos[index] = todo;
  }

  // remove the task
  void removeTask(int index) {
    todos.removeAt(index);
  }
}
