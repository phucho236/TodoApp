import 'package:TodoApp/model/todo_model.dart';
import 'package:TodoApp/reducers_thunk.dart';
import 'package:TodoApp/widget/todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class HomePage extends StatelessWidget {
  final int type;
  HomePage({@required this.type});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<TodoModel>, List<TodoModel>>(
      converter: (store) => store.state,
      onInit: (store) => store.dispatch(GetTodosThunkAction().call(store)),
      builder: (context, list) {
        return list == null || list.length < 1
            ? Center(child: Text("No Data"))
            : brainReturnTodoList(type, list);
      },
    );
  }
}
