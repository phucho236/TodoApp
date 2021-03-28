import 'package:TodoApp/model/todo_model.dart';
import 'package:TodoApp/reducers_thunk.dart';
import 'package:TodoApp/until/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AddTodoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<TodoModel>, OnAddCallback>(converter: (store) {
      return (todo) => store.dispatch(AddTodoThunkAction(TodoModel(
              id: DateTime.now().microsecondsSinceEpoch.toString(),
              note: todo,
              complete: false))
          .call(store));
    }, builder: (context, callback) {
      return AddTodoDialogWidget(callback);
    });
  }
}

class AddTodoDialogWidget extends StatefulWidget {
  final OnAddCallback callback;

  AddTodoDialogWidget(this.callback);
  @override
  State<StatefulWidget> createState() => new AddTodoDialogWidgetState();
}

class AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  String itemName;
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      elevation: 0.1,
      contentPadding: const EdgeInsets.all(16.0),
      content: Form(
        key: _formKey,
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                validator: (value) => Validator.validateText(value),
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'Note', hintText: 'Ex. this is Example'),
                onChanged: _handleTextChanged,
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.pop(context);
            }),
        TextButton(
            child: const Text('ADD'),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Complete')));
                Navigator.pop(context);
                widget.callback(itemName);
              }
            })
      ],
    );
  }

  _handleTextChanged(String newItemName) {
    setState(() {
      itemName = newItemName;
    });
  }
}

typedef OnAddCallback = Function(String itemName);
