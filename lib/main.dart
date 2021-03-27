
import 'package:TodoApp/model/todo_model.dart';
import 'package:TodoApp/reducers.dart';
import 'package:TodoApp/views/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
void main() {
  final store = Store<List<TodoModel>>(
    brainTodos,
    initialState: [],
   middleware: [thunkMiddleware]
  );
  runApp(MyApp(store: store));
}
class MyApp extends StatelessWidget {
  final Store<List<TodoModel>> store;
  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    
    return StoreProvider<List<TodoModel>>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: HomeLayout(),
      ),
    );
  }
}
