import 'package:TodoApp/action.dart';
import 'package:TodoApp/model/todo_model.dart';
import 'package:TodoApp/reducers.dart';
import 'package:TodoApp/reducers_thunk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  //To use rootBundle
  TestWidgetsFlutterBinding.ensureInitialized();
  //
  Store<List<TodoModel>> store;

  setUp(() {
    store = store = Store<List<TodoModel>>(brainTodos,
        initialState: [], middleware: [thunkMiddleware]);
  });

  test('GetTodosThunkActionTest', () async {
    await store.dispatch(GetTodosThunkActionTest().call(store));
    expect(store.state.length, 4);
  });
  test('AddThunkActionTest', () async {
    await store.dispatch(AddTodoThunkActionTest(TodoModel(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            note: "todo",
            complete: false))
        .call(store));
    expect(store.state.length, 5);
  });
  test('Test Preferences', () async {
    SharedPreferences.setMockInitialValues({}); //set values here
    SharedPreferences pref = await SharedPreferences.getInstance();

    String keyTodos = 'keyTodos';

    String todos = [
      {
        "id": "1616936962382780",
        "complete": false,
        "note": "remove some acount"
      }
    ].toString();
    pref.setString(keyTodos, todos);
    expect(pref.getString(keyTodos), todos);
  });
  
}
