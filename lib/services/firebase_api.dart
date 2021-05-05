import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sherpa_app/models/todo.dart';
import 'package:sherpa_app/utils.dart';

class FirebaseApi {
  final String? uid;
  FirebaseApi({this.uid});

  Future<String> createTodo(Todo todo) async {
    //final docTodo = FirebaseFirestore.instance.collection('todo').doc();
    final docTodo = FirebaseFirestore.instance
        .collection('userData')
        .doc(uid)
        .collection('userHabit')
        .doc();
    todo.id = docTodo.id;
    await docTodo.set(todo.toJson());

    return docTodo.id;
  }

  Stream<List<Todo>> readTodos() => FirebaseFirestore.instance
      .collection('userData')
      .doc(uid)
      .collection('userHabit')
      .orderBy(TodoField.createdTime, descending: true)
      .snapshots()

      /*
          .map((QuerySnapshot<Map<String, dynamic>> snapshot) {
        final _return = <Todo>[];
        for (var item in snapshot.docs) {
          print(item.exists);
          if (item.exists) {
            _return.add(Todo.fromDocumentSnapshot(item));
          }
        }
        return _return;
      });
      */
      .transform(Utils.transformer<Todo>(Todo.fromJson)); //KATKI??

  Future updateTodo(Todo todo) async {
    final docTodo = FirebaseFirestore.instance
        .collection('userData')
        .doc(uid)
        .collection('userHabit')
        .doc(todo.id);

    await docTodo.update(todo.toJson());
  }

  Future deleteTodo(Todo todo) async {
    final docTodo = FirebaseFirestore.instance
        .collection('userData')
        .doc(uid)
        .collection('userHabit')
        .doc(todo.id);

    await docTodo.delete();
  }
}
