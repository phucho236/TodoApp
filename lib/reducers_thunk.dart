import 'dart:convert';
import 'package:TodoApp/action.dart';
import 'package:TodoApp/model/todo_model.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:TodoApp/shared_preferences/shared_preferences.dart' as srp;

class ToggleItemStateThunkAction
    implements CallableThunkAction<List<TodoModel>> {
  final TodoModel item;
  ToggleItemStateThunkAction(this.item);
  @override
  call(Store<List<TodoModel>> store) async {
    List<TodoModel> tdmls = store.state;
    tdmls[tdmls.indexWhere((element) => element.id == item.id)] = item;
    await srp.setTodos(newValue: jsonEncode(tdmls));
    store.dispatch(ToggleItemStateAction(
        tdmls[tdmls.indexWhere((element) => element.id == item.id)]));
  }
}

class GetTodosThunkAction implements CallableThunkAction<List<TodoModel>> {
  @override
  call(Store<List<TodoModel>> store) async {
    List<TodoModel> tdmls = store.state;
    List<dynamic> tdmlstmp;
    tdmlstmp = jsonDecode(await srp.getTodos() ?? '[]');
    tdmls = tdmlstmp.map((data) => TodoModel.fromJson(data)).toList();
    store.dispatch(GetTodosAction(tdmls));
  }
}

class AddTodoThunkAction implements CallableThunkAction<List<TodoModel>> {
  final TodoModel item;
  AddTodoThunkAction(this.item);
  @override
  call(Store<List<TodoModel>> store) async {
    List<TodoModel> tdmls = store.state;
    tdmls.insert(0, item);
    await srp.setTodos(newValue: jsonEncode(tdmls));
    store.dispatch(AddTodoAction(tdmls));
  }
}

class RemoveTodoThunkAction implements CallableThunkAction<List<TodoModel>> {
  final TodoModel item;
  RemoveTodoThunkAction(this.item);
  @override
  call(Store<List<TodoModel>> store) async {
    List<TodoModel> tdmls = store.state;
    tdmls.removeAt(tdmls.indexWhere((element) => element == item));
    await srp.setTodos(newValue: jsonEncode(tdmls));
    store.dispatch(RemoveTodoAction(tdmls));
  }
}
