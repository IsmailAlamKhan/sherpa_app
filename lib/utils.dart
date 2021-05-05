import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/todo.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      Scaffold.of(context);
  //..ScaffoldMessenger.removeCurrentSnackBar()
  // ..ScaffoldMessenger.showSnackBar(SnackBar(content: Text(text)));

  static DateTime? toDateTime(Timestamp? value) {
    if (value == null) return null;

    return value.toDate();
  }

  static dynamic fromDateTimeToJson(DateTime? date) {
    if (date == null) return null;

    return date.toUtc();
  }

  static StreamTransformer transformer<T>(
          T Function(Map<String, dynamic> json) fromJson) =>
      StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
        handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
          final List<Object?> snaps =
              data.docs.map((doc) => doc.data()).toList();

          final List<T> objects = snaps
              .map((json) => fromJson(json as Map<String, dynamic>))
              .toList();

          sink.add(objects);
        },
      );

  static StreamTransformer simpletran(
          Todo Function(Map<String, dynamic> json) fromJson) =>
      StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
          List<Todo>>.fromHandlers(
        handleData: (QuerySnapshot data, EventSink<List<Todo>> sink) {
          final List<Map<String, dynamic>> snaps = data.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();

          //* We need to convert the [Object?] into Map<String, dynamic> somehow

          final List<Todo> objects =
              snaps.map((json) => fromJson(json)).toList();

          sink.add(objects);
        },
      );
}
