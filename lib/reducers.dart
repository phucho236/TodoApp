import 'package:TodoApp/action.dart';
import 'package:TodoApp/model/todo_model.dart';
List<TodoModel> brainTodos(List<TodoModel> todos, dynamic action) {
  if (action is GetTodosAction) {
    todos = action.item;
  }
  if (action is AddTodoAction) {
    todos = action.item;
  }
  if (action is RemoveTodoAction) {
    todos = action.item;
  }
  if (action is ToggleItemStateAction) {
    todos = toggleTodoState(todos, action);
  }
  return todos;
}

List<TodoModel> toggleTodoState(
    List<TodoModel> todos, ToggleItemStateAction action) {
  return todos
      .map((item) => item.id == action.item.id ? action.item : item)
      .toList();
}
