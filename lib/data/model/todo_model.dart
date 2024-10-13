import 'dart:convert';

import 'package:dioreq/domain/entity/todo_entity.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModel {
  int userId;
  int id;
  String title;
  bool completed;
  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) => TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension TodoXModel on TodoModel {
  TodoEntity toEntity() {
    return TodoEntity(
      userId: userId,
      id: id,
      title: title,
      completed: completed,
    );
  }
}
