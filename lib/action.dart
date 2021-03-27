import 'package:TodoApp/model/todo_model.dart';
class UpgradeTodoAction {
  final TodoModel item;
  UpgradeTodoAction(this.item);
}
class AddTodoAction {
  final List<TodoModel> item;
  AddTodoAction(this.item);
}
class RemoveTodoAction {
  final List<TodoModel> item;
  RemoveTodoAction(this.item);
}
class GetTodosAction {
  final List<TodoModel> item;
  GetTodosAction(this.item);
}
class ToggleItemStateAction {
  final TodoModel item;
  ToggleItemStateAction(this.item);
}
