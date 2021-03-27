import 'package:TodoApp/model/todo_model.dart';
import 'package:TodoApp/reducers_thunk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoModel item;
  TodoItemWidget(this.item);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<TodoModel>, _ViewModel>(converter: (store) {
      return _ViewModel.create(store);
    }, builder: (context, vm) {
      return Dismissible(
        key: Key(item.id),
        onDismissed: (direction) => vm.onSwide(item),
        child: ListTile(
          title: Text(item.note),
          trailing: IconButton(
            onPressed: () => vm.onSwide(item),
            icon: Icon(Icons.remove_circle),
          ),
          leading: Checkbox(
            value: item.complete,
            onChanged: (bool newValue) {
              vm.onChangeState(
                  TodoModel(id: item.id, note: item.note, complete: newValue));
            },
          ),
        ),
      );
    });
  }
}

class _ViewModel {
  final Function(TodoModel) onSwide;
  final Function(TodoModel) onChangeState;
  _ViewModel({this.onSwide, this.onChangeState});
  factory _ViewModel.create(Store<List<TodoModel>> store) {
    _onChangeState(TodoModel todo) {
      store.dispatch(ToggleItemStateThunkAction(todo).call(store));
    }
    _onSwide(TodoModel todo) {
      store.dispatch(RemoveTodoThunkAction(todo).call(store));
    }
    return _ViewModel(onSwide: _onSwide, onChangeState: _onChangeState);
  }
}
