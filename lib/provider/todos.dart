import 'package:flutter/cupertino.dart';
import 'package:sherpa_app/services/firebase_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sherpa_app/models/todo.dart';


class TodosProvider extends ChangeNotifier {

  final FirebaseAuth auth = FirebaseAuth.instance;

   inputData() async{
    final User user = auth.currentUser!;
    String uid = user.uid;
    print('UID TEST');
    print(uid);
    return uid;
  }
  List<Todo>? _todos = [];

  List<Todo> get todos => _todos!.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos!.where((todo) => todo.isDone == true).toList();

  void setTodos(List<Todo>? todos) =>
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        _todos = todos;
        notifyListeners();
      });

  void addTodo(Todo todo) async => FirebaseApi(uid:await inputData()).createTodo(todo);

  void removeTodo(Todo todo) async => FirebaseApi(uid:await inputData()).deleteTodo(todo);

  /*Future<bool> toggleTodoStatus(Todo todo) async {
    todo.isDone = !todo.isDone;
    FirebaseApi(uid:await inputData()).updateTodo(todo);

    return todo.isDone;
  }*/

  void updateTodo(Todo todo, String? title, String? description) async {
    todo.title = title;
    todo.description = description;

    FirebaseApi(uid:await inputData()).updateTodo(todo);
  }
}
