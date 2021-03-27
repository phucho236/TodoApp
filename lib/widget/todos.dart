import 'package:TodoApp/model/todo_model.dart';
import 'package:TodoApp/widget/todo_item_widget.dart';
import 'package:flutter/material.dart';

Widget brainReturnTodoList(int type, List<TodoModel> list) {
  int itemCount = list.length;
  print(list.length);
  switch (type) {
    case 1:
      return ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, position) => TodoItemWidget(list[position]));
      break;
    case 2:
      return ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, position) {
            return list[position].complete == true
                ? TodoItemWidget(list[position])
                : Container();
          });
      break;
    case 3:
      return ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, position) {
            return list[position].complete == false
                ? TodoItemWidget(list[position])
                : Container();
          });
      break;
    default:
      return Center(
        child: Text("Err"),
      );
  }
}
